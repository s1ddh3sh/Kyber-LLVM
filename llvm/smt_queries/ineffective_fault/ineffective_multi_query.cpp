#include "z3++.h"
#include <algorithm>
#include <atomic>
#include <cctype>
#include <filesystem>
#include <fstream>
#include <functional>
#include <iostream>
#include <map>
#include <mutex>
#include <regex>
#include <set>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <utility>
#include <vector>

using namespace z3;
using namespace std;
namespace fs = std::filesystem;

// =====================================================================
// File-text utilities
// =====================================================================

static string json_arr(const vector<long long> &v) {
  ostringstream oss;
  oss << "[";
  for (size_t i = 0; i < v.size(); i++) {
    if (i)
      oss << ",";
    oss << v[i];
  }
  oss << "]";
  return oss.str();
}

static long long eval_i64(model &m, const expr &e) {
  return m.eval(e, true).simplify().get_numeral_int64();
}

static string read_file(const string &filename) {
  ifstream ifs(filename);
  if (!ifs) {
    cerr << "Cannot open: " << filename << "\n";
    exit(1);
  }
  return string((istreambuf_iterator<char>(ifs)), istreambuf_iterator<char>());
}

static size_t match_paren(const string &s, size_t open) {
  int depth = 0;
  for (size_t i = open; i < s.size(); i++) {
    if (s[i] == '(')
      depth++;
    else if (s[i] == ')') {
      depth--;
      if (depth == 0)
        return i;
    }
  }
  return string::npos;
}

static string strip_bad_asserts(const string &src) {
  regex bad_assert(R"(\(assert\s+and\s*\)\s*)");
  return regex_replace(src, bad_assert, "");
}

static string strip_last_assert(const string &src) {
  size_t pos = src.rfind("(assert");
  if (pos == string::npos)
    return src;
  size_t end = match_paren(src, pos);
  if (end == string::npos)
    return src;
  return src.substr(0, pos) + src.substr(end + 1);
}

// NOTE the trailing `*` (was `+`): llvmbmc emits anonymous temporaries named
// `i_7_`, `i_12_`, ... with nothing after the final underscore. With `+`
// those names were left UNSUFFIXED, so the C1/F1/C2/F2 copies collapsed onto
// the same Z3 constant and were silently forced equal across executions.
static string write_suffixed(const string &content, const string &tag,
                             const string &outDir) {
  string result = content;
  regex ident(R"(\b((?:i|c|b)_\d+_[A-Za-z0-9_.]*)\b)");
  result = regex_replace(result, ident, "$1_" + tag);

  string path = outDir + "/" + tag + ".smt2";
  ofstream ofs(path);
  if (!ofs) {
    cerr << "Cannot write " << path << "\n";
    exit(1);
  }
  ofs << result;
  return path;
}

// llvmbmc's SMT-LIB printer emits some intermediates as anonymous integer
// temporaries -- `(declare-fun i_7_ () Int)` with nothing after the final
// underscore -- and never writes a defining equation for them anywhere in
// the file. In lincomb these appear exactly as `(* i_42_ (select mem addr))`
// inside a conditional-XOR chain: the standard "multiply by one bit of the
// GF(16) multiplier, else 0" idiom from schoolbook double-and-add
// multiplication. Bounding them to {0,1} is an ASSUMPTION about their
// meaning, stated explicitly and printed at runtime -- if wrong for a given
// function, its results should be treated as unverified until the upstream
// trace emits real defining equations for these temporaries.
static vector<string> find_anonymous_int_temps(const string &src) {
  static const regex re(R"(\(declare-fun\s+(i_\d+_)\s+\(\)\s+Int\))");
  vector<string> out;
  for (auto it = sregex_iterator(src.begin(), src.end(), re),
            e = sregex_iterator();
       it != e; ++it)
    out.push_back((*it)[1].str());
  return out;
}

// =====================================================================
// Memory layout, parsed from the trace's own comments.
// =====================================================================

struct MemRegion {
  string name;
  long long start = 0;
  long long end = 0; // inclusive
  long long size() const { return end - start + 1; }
};

struct MemoryLayout {
  map<string, MemRegion> regions;
  vector<string> order;
  string initialMem;
  string finalMem;
};

static string parse_tagged_symbol(const string &src, const string &tag) {
  regex re(";;\\s*" + tag + "\\s+([A-Za-z0-9_.]+)");
  smatch m;
  if (!regex_search(src, m, re))
    throw runtime_error("Could not find ';; " + tag +
                        " <symbol>' comment in trace");
  return m[1].str();
}
static MemoryLayout parse_layout(const string &src) {
  MemoryLayout L;

  static const regex re(
      R"(;;\s*Array\s+([A-Za-z_][A-Za-z0-9_.]*)\s+(-?\d+)\s+(-?\d+))");

  for (auto it = sregex_iterator(src.begin(), src.end(), re),
            e = sregex_iterator();
       it != e; ++it) {

    string name = (*it)[1].str();
    string start = (*it)[2].str();
    string end = (*it)[3].str();

    // cerr << "[DEBUG parse_layout] " << name << " start='" << start << "'
    // end='"
    //  << end << "'\n";

    MemRegion r;
    r.name = name;

    try {
      r.start = stoll(start);
    } catch (const std::exception &ex) {
      throw runtime_error("stoll failed parsing START for region '" + name +
                          "': '" + start + "' (" + ex.what() + ")");
    }

    try {
      r.end = stoll(end);
    } catch (const std::exception &ex) {
      throw runtime_error("stoll failed parsing END for region '" + name +
                          "': '" + end + "' (" + ex.what() + ")");
    }

    if (r.end < r.start)
      throw runtime_error("Malformed region for '" + name + "'");

    if (!L.regions.count(r.name))
      L.order.push_back(r.name);

    L.regions[r.name] = r;
  }

  if (L.regions.empty())
    throw runtime_error("No ';; Array <name> <start> <end>' comments found");

  L.finalMem = parse_tagged_symbol(src, "Final_Memory");
  return L;
}
// Find the memory SSA arrays that the scalar return anchor actually reads.
static vector<string> find_anchor_read_memories(const string &src,
                                                const string &anchorSym) {
  size_t defPos = src.rfind("(= " + anchorSym);
  if (defPos == string::npos)
    throw runtime_error("Could not find the defining assert for '" + anchorSym +
                        "'");

  size_t assertStart = src.rfind("(assert", defPos);
  if (assertStart == string::npos)
    throw runtime_error("Malformed assert around '" + anchorSym + "'");

  size_t end = match_paren(src, assertStart);
  if (end == string::npos)
    throw runtime_error("Unbalanced assert around '" + anchorSym + "'");

  string block = src.substr(assertStart, end - assertStart + 1);

  static const regex selectMem(R"(\(select\s+(c_\d+_[A-Za-z0-9_.]+)\s+)");

  vector<string> result;
  set<string> seen;

  for (auto it = sregex_iterator(block.begin(), block.end(), selectMem),
            e = sregex_iterator();
       it != e; ++it) {
    string mem = (*it)[1].str();
    if (seen.insert(mem).second)
      result.push_back(mem);
  }

  if (result.empty())
    throw runtime_error("Scalar anchor '" + anchorSym +
                        "' contains no select(memory, address) reads");

  return result;
}

static void check_layouts_match(const MemoryLayout &a, const MemoryLayout &b) {
  if (a.regions.size() != b.regions.size())
    throw runtime_error(
        "correct/faulty traces declare different region counts");
  for (auto &kv : a.regions) {
    auto it = b.regions.find(kv.first);
    if (it == b.regions.end())
      throw runtime_error("Region '" + kv.first +
                          "' missing from faulty trace");
    if (it->second.start != kv.second.start || it->second.end != kv.second.end)
      throw runtime_error("Region '" + kv.first +
                          "' has different bounds in correct vs faulty trace");
  }
}

static void print_layout(const MemoryLayout &L, const string &which) {
  cout << "[layout:" << which << "] initial=" << L.initialMem
       << " final=" << L.finalMem << "\n";
  for (auto &n : L.order) {
    const MemRegion &r = L.regions.at(n);
    cout << "    " << n << " [" << r.start << ".." << r.end << "] (" << r.size()
         << " bytes)\n";
  }
}

static string resolve_final_ssa_symbol(const string &src, const string &base,
                                       bool faulty) {
  string suffix = faulty ? "_faulty" : "_correct";
  regex re("i_(\\d+)_" + base + suffix);
  auto begin = sregex_iterator(src.begin(), src.end(), re);
  auto end = sregex_iterator();
  string best;
  long bestN = -1;
  for (auto it = begin; it != end; ++it) {
    long n = stol((*it)[1].str());
    if (n > bestN) {
      bestN = n;
      best = (*it)[0].str();
    }
  }
  if (bestN < 0)
    throw runtime_error("Could not resolve any SSA version for '" + base +
                        "' (looked for i_<N>_" + base + suffix + ")");
  return best;
}
static string strip_scalar_pin(const string &src, const string &base,
                               bool faulty) {
  string suffix = faulty ? "_faulty" : "_correct";
  regex re("\\(assert\\s*\\(=\\s*i_\\d+_" + base + suffix +
           "\\s+-?\\d+\\)\\)\\s*");
  return regex_replace(src, re, "");
}
static bool trace_pinned_scalar(const string &src, const string &base,
                                bool faulty, long long &out) {
  string suffix = faulty ? "_faulty" : "_correct";

  regex re("\\(assert\\s*\\(=\\s*i_\\d+_" + base + suffix +
           "\\s+(-?\\d+)\\)\\)");

  smatch m;

  if (!regex_search(src, m, re))
    return false;

  // cerr << "[DEBUG trace_pinned_scalar] base='" << base << "' matched='"
  //  << m[1].str() << "'\n";

  try {
    out = stoll(m[1].str());
  } catch (const std::exception &e) {
    throw runtime_error("stoll failed in trace_pinned_scalar: base='" + base +
                        "', value='" + m[1].str() + "', error=" + e.what());
  }

  return true;
}
// llvmbmc emits GF(16) reduction steps as `(div X (to_int (^ 2 4)))` --
// integer power of two LITERAL constants, always 16. Z3 routes `^` between
// two Ints through nonlinear integer arithmetic reasoning even when both
// operands are constants, which is drastically more expensive than the
// plain linear `div` this actually is. Fold it to the literal it always
// evaluates to before Z3 ever sees it -- this changes nothing about the
// formula's meaning, only how cheaply Z3 can decide it. Without this,
// lincomb's 7-8 stacked reduction branches combined with the anonymous
// temporaries above were observed to time out on EVERY sweep value/alpha
// candidate (UNKNOWN, not UNSAT) -- i.e. inconclusive, not a negative
// result about the fault.
static string fold_constant_arith(const string &srcIn) {
  string src = srcIn;
  {
    static const regex powRe(R"(\(\^\s+(\d+)\s+(\d+)\))");
    string result;
    size_t lastEnd = 0;
    for (auto it = sregex_iterator(src.begin(), src.end(), powRe),
              e = sregex_iterator();
         it != e; ++it) {
      result += src.substr(lastEnd, it->position() - lastEnd);
      long long base = stoll((*it)[1].str());
      long long exp = stoll((*it)[2].str());
      long long val = 1;
      for (long long k = 0; k < exp; k++)
        val *= base;
      result += to_string(val);
      lastEnd = it->position() + it->length();
    }
    result += src.substr(lastEnd);
    src = result;
  }
  {
    // (to_int N) with N now a plain literal (from the fold above, or
    // already literal in the source) is just N.
    static const regex toIntRe(R"(\(to_int\s+(-?\d+)\))");
    src = regex_replace(src, toIntRe, "$1");
  }
  return src;
}

// =====================================================================
// Detect a faulty trace that is IDENTICAL to the correct trace once its SSA
// labelling is normalized away.
// =====================================================================

static string normalize_trace_labels(const string &src, bool faulty) {
  string suffix = faulty ? "_faulty" : "_correct";
  string memName = faulty ? "Global_M_faulty" : "Global_M_correct";
  string out;
  out.reserve(src.size());

  size_t pos = 0;
  while (pos < src.size()) {
    size_t p1 = src.find(memName, pos);
    size_t p2 = src.find(suffix, pos);
    size_t p = min(p1, p2);
    if (p == string::npos) {
      out += src.substr(pos);
      break;
    }
    out += src.substr(pos, p - pos);
    if (p == p1) {
      out += "Global_M_X";
      pos = p + memName.size();
    } else {
      out += "_X";
      pos = p + suffix.size();
    }
  }
  return out;
}

static bool traces_structurally_identical(const string &correct_src,
                                          const string &faulty_src) {
  return normalize_trace_labels(correct_src, false) ==
         normalize_trace_labels(faulty_src, true);
}

// =====================================================================
// Minimal flat-JSON reader. Insertion order is PRESERVED.
// =====================================================================

struct JsonValue {
  enum Kind { KIND_STRING, KIND_INT, KIND_INT_ARRAY, KIND_OBJECT } kind = KIND_INT;
  bool isString = false; // true iff kind==KIND_STRING; kept for existing scalar call sites
  string s;
  long long i = 0;
  vector<long long> arr;            // KIND_INT_ARRAY
  vector<pair<string, string>> obj; // KIND_OBJECT (flat, string-valued only)
};
using JsonObj = vector<pair<string, JsonValue>>;

static const JsonValue *json_find(const JsonObj &o, const string &key) {
  for (auto &kv : o)
    if (kv.first == key)
      return &kv.second;
  return nullptr;
}

static void json_skipws(const string &text, size_t &i) {
  while (i < text.size() && isspace((unsigned char)text[i]))
    i++;
}

// Parses one JSON value: string, integer, [int,int,...] array (the real
// function_inputs files store full per-coefficient poly data this way),
// [[int,...],[int,...],...] array-of-arrays (polyvec_*/matrix functions:
// one sub-array per KYBER_K vector component -- flattened in row-major
// order into the same flat v.arr, matching the trace's memory layout,
// where vector component k's coefficients occupy one contiguous run at
// k*256+i, same as C's poly vec[KYBER_K]), or a flat string-valued {..}
// object (only used for "distribution":{...}). Not a general recursive
// JSON parser -- nesting beyond these shapes is not needed by any
// function_inputs file in this repo.
static JsonValue parse_json_value(const string &text, size_t &i) {
  json_skipws(text, i);
  JsonValue v;
  if (i < text.size() && text[i] == '"') {
    size_t se = text.find('"', i + 1);
    if (se == string::npos)
      throw runtime_error("JSON: unterminated string");
    v.kind = JsonValue::KIND_STRING;
    v.isString = true;
    v.s = text.substr(i + 1, se - i - 1);
    i = se + 1;
  } else if (i < text.size() && text[i] == '[') {
    v.kind = JsonValue::KIND_INT_ARRAY;
    i++;
    json_skipws(text, i);
    if (i < text.size() && text[i] == ']') {
      i++;
    } else {
      while (true) {
        json_skipws(text, i);
        if (i < text.size() && text[i] == '[') {
          JsonValue inner = parse_json_value(text, i);
          if (inner.kind != JsonValue::KIND_INT_ARRAY)
            throw runtime_error("JSON: expected a nested array of integers");
          v.arr.insert(v.arr.end(), inner.arr.begin(), inner.arr.end());
        } else {
          size_t st = i;
          if (i < text.size() && (text[i] == '-' || text[i] == '+'))
            i++;
          while (i < text.size() && isdigit((unsigned char)text[i]))
            i++;
          if (st == i)
            throw runtime_error(
                "JSON: expected an integer or nested array in array");
          v.arr.push_back(stoll(text.substr(st, i - st)));
        }
        json_skipws(text, i);
        if (i < text.size() && text[i] == ',') {
          i++;
          continue;
        }
        if (i < text.size() && text[i] == ']') {
          i++;
          break;
        }
        throw runtime_error("JSON: expected ',' or ']' in array");
      }
    }
  } else if (i < text.size() && text[i] == '{') {
    v.kind = JsonValue::KIND_OBJECT;
    i++;
    json_skipws(text, i);
    if (i < text.size() && text[i] == '}') {
      i++;
    } else {
      while (true) {
        json_skipws(text, i);
        if (i >= text.size() || text[i] != '"')
          throw runtime_error("JSON: expected a quoted key in nested object");
        size_t e = text.find('"', i + 1);
        string key = text.substr(i + 1, e - i - 1);
        i = e + 1;
        json_skipws(text, i);
        if (i >= text.size() || text[i] != ':')
          throw runtime_error("JSON: expected ':' in nested object");
        i++;
        json_skipws(text, i);
        if (i >= text.size() || text[i] != '"')
          throw runtime_error("JSON: nested object '" + key +
                              "' must be a string value");
        size_t se = text.find('"', i + 1);
        string val = text.substr(i + 1, se - i - 1);
        i = se + 1;
        v.obj.push_back({key, val});
        json_skipws(text, i);
        if (i < text.size() && text[i] == ',') {
          i++;
          continue;
        }
        if (i < text.size() && text[i] == '}') {
          i++;
          break;
        }
        throw runtime_error("JSON: expected ',' or '}' in nested object");
      }
    }
  } else {
    size_t st = i;
    if (i < text.size() && (text[i] == '-' || text[i] == '+'))
      i++;
    while (i < text.size() && isdigit((unsigned char)text[i]))
      i++;
    if (st == i)
      throw runtime_error("JSON: expected a value");
    v.kind = JsonValue::KIND_INT;
    v.isString = false;
    v.s = text.substr(st, i - st);
    try {
      v.i = stoll(v.s);
    } catch (const std::out_of_range &) {
      // Allow large integers to remain textual; used only as
      // metadata/baseline values.
      v.i = 0;
    }
  }
  return v;
}

static JsonObj parse_flat_json(const string &text) {
  JsonObj out;
  size_t i = 0;
  json_skipws(text, i);
  if (i >= text.size() || text[i] != '{')
    throw runtime_error("JSON: expected '{'");
  i++;
  json_skipws(text, i);
  if (i < text.size() && text[i] == '}')
    return out;

  while (true) {
    json_skipws(text, i);
    if (i >= text.size() || text[i] != '"')
      throw runtime_error("JSON: expected a quoted key");
    size_t e = text.find('"', i + 1);
    if (e == string::npos)
      throw runtime_error("JSON: unterminated key");
    string key = text.substr(i + 1, e - i - 1);
    i = e + 1;

    json_skipws(text, i);
    if (i >= text.size() || text[i] != ':')
      throw runtime_error("JSON: expected ':' after key '" + key + "'");
    i++;

    JsonValue v = parse_json_value(text, i);
    out.push_back({key, v});

    json_skipws(text, i);
    if (i < text.size() && text[i] == ',') {
      i++;
      continue;
    }
    if (i < text.size() && text[i] == '}')
      break;
    throw runtime_error("JSON: expected ',' or '}'");
  }
  return out;
}

// The real function_inputs files (e.g. function_inputs/poly_add.json) are
// JSON-LINES: one independently-sampled scenario per line, matching each
// argument's real distribution (poly_add.json ships 10). This query needs
// exactly one fixed/baseline scenario, so it takes the first well-formed
// line; it does not sweep across all sampled scenarios.
static JsonObj parse_flat_json_first_record(const string &filePath) {
  ifstream ifs(filePath);
  if (!ifs) {
    cerr << "Cannot open: " << filePath << "\n";
    exit(1);
  }
  string line;
  while (getline(ifs, line)) {
    size_t a = line.find_first_not_of(" \t\r\n");
    if (a == string::npos)
      continue;
    return parse_flat_json(line);
  }
  throw runtime_error("No JSON record found in " + filePath);
}

// tests_kyber/ names every function directory with this prefix (matching
// the mangled C symbol), but function_inputs/ (a separate, pre-existing
// tool's output) names files after the bare function name (poly_add.json,
// not pqcrystals_kyber768_ref_poly_add.json).
static string kyber_base_name(const string &fn) {
  static const string prefix = "pqcrystals_kyber768_ref_";
  if (fn.rfind(prefix, 0) == 0)
    return fn.substr(prefix.size());
  return fn;
}

// =====================================================================
// Parameter <-> region mapping.
// =====================================================================

struct ArgMap {
  map<string, string> paramToRegion;
  map<string, string> regionToParam;
  map<string, long long> activeLen;
};

static bool is_internal_region(const string &name, const string &fn,
                               const string &src) {
  if (name == "__mbc_ret_anchor_" + fn)
    return true;
  if (name.rfind("__mbc_arg_", 0) == 0)
    return true;
  long long dummy;
  return trace_pinned_scalar(src, name, false, dummy);
}

// Kyber's harness allocates one buffer per pointer PARAMETER (in C
// declaration order, output included -- e.g. poly_add(r,a,b) allocates
// v(r), v1(a), epp(b)), unlike MAYO where the output was sometimes absent
// from active_lengths and sometimes not the first/last argument. Rather
// than guess the output's position from active_lengths alone, the
// function_inputs spec names the FULL parameter order explicitly via
// "params":"r,a,b"; this zips it 1:1 against the trace's buffer regions in
// ascending address order, which is how the harness itself allocates them.
// active_lengths.json (produced by a separate tool) gives lengths in BYTES,
// while the trace addresses memory per element (e.g. 256 slots for a
// 256-coefficient poly, not 512 bytes) -- so a byte length that evenly
// divides the region's address-unit size is treated as "fully active at
// that element width" rather than taken literally.
static ArgMap build_arg_map_from_param_order(const string &activePath,
                                             const MemoryLayout &L,
                                             const vector<string> &bufferRegions,
                                             const vector<string> &paramOrder) {
  ArgMap M;
  if (paramOrder.size() != bufferRegions.size())
    throw runtime_error(
        "\"params\" lists " + to_string(paramOrder.size()) +
        " parameter(s) but the trace declares " +
        to_string(bufferRegions.size()) +
        " buffer region(s) -- update \"params\" in the function_inputs "
        "spec to name every pointer argument in address order");

  JsonObj act;
  bool haveAct = fs::exists(activePath);
  if (haveAct)
    act = parse_flat_json(read_file(activePath));

  for (size_t i = 0; i < paramOrder.size(); i++) {
    const string &param = paramOrder[i];
    const string &region = bufferRegions[i];
    M.paramToRegion[param] = region;
    M.regionToParam[region] = param;

    const MemRegion &r = L.regions.at(region);
    long long activeLen = r.size();
    if (haveAct) {
      const JsonValue *v = json_find(act, param);
      if (v) {
        if (v->isString)
          throw runtime_error("active_lengths: '" + param +
                              "' must be an integer");
        long long lenBytes = (long long)v->i;
        if (lenBytes == r.size()) {
          activeLen = lenBytes;
        } else if (r.size() > 0 && lenBytes % r.size() == 0) {
          activeLen = r.size(); // fully active; lenBytes/r.size() is the
                                // element width in bytes
        } else {
          throw runtime_error(
              "active_lengths: '" + param + "' = " + to_string(lenBytes) +
              " bytes does not evenly divide region '" + region + "' (" +
              to_string(r.size()) +
              " address units) -- cannot infer element width");
        }
      }
    }
    M.activeLen[region] = activeLen;
    cout << "[map] " << param << " -> " << region << " (" << activeLen
         << " active address units of " << r.size() << ")\n";
  }
  return M;
}

static ArgMap build_arg_map(const string &fn, const string &activePath,
                            const MemoryLayout &L, const string &src,
                            const string &outputName,
                            const vector<string> &paramOrder) {
  const string anchorRegion = "__mbc_ret_anchor_" + fn;
  const bool hasAnchor = L.regions.count(anchorRegion) > 0;

  // Buffer regions in ARGUMENT order: the harness allocas its buffers in the
  // order it passes them to the call, so ascending start address == position.
  vector<string> bufferRegions;
  for (auto &n : L.order)
    if (!is_internal_region(n, fn, src))
      bufferRegions.push_back(n);
  std::sort(bufferRegions.begin(), bufferRegions.end(),
            [&](const string &a, const string &b) {
              return L.regions.at(a).start < L.regions.at(b).start;
            });

  if (!paramOrder.empty())
    return build_arg_map_from_param_order(activePath, L, bufferRegions,
                                          paramOrder);

  ArgMap M;

  auto mapOutputToAnchor = [&] {
    M.paramToRegion[outputName] = anchorRegion;
    M.regionToParam[anchorRegion] = outputName;
    cout << "[note] output '" << outputName
         << "' is the scalar return value (captured in " << anchorRegion
         << ")\n";
  };

  if (!fs::exists(activePath)) {
    cout << "[note] no " << activePath
         << " -- using region names as-is and full region lengths\n";
    for (auto &n : bufferRegions) {
      M.paramToRegion[n] = n;
      M.regionToParam[n] = n;
    }
    if (!L.regions.count(outputName) && hasAnchor)
      mapOutputToAnchor();
    return M;
  }

  // Pointer params in declaration order (JSON order is preserved).
  JsonObj act = parse_flat_json(read_file(activePath));
  vector<pair<string, long long>> bufferParams;
  for (auto &kv : act) {
    if (kv.second.isString)
      throw runtime_error("active_lengths: '" + kv.first +
                          "' must be an integer");
    const string scalarBase = "__mbc_arg_" + fn + "_" + kv.first;
    long long dummy;
    if (L.regions.count(scalarBase) ||
        trace_pinned_scalar(src, scalarBase, false, dummy)) {
      M.paramToRegion[kv.first] = scalarBase;
      continue;
    }
    bufferParams.push_back({kv.first, kv.second.i});
  }

  bool outputIsPointerParam = any_of(
      bufferParams.begin(), bufferParams.end(),
      [&](const pair<string, long long> &p) { return p.first == outputName; });

  vector<string> matchRegions = bufferRegions;
  if (outputIsPointerParam) {
    // Output is one of the listed pointer args -- zip positionally below.
  } else if (hasAnchor && bufferParams.size() == bufferRegions.size()) {
    mapOutputToAnchor(); // e.g. lincomb's `c`
  } else if (bufferParams.size() + 1 == bufferRegions.size()) {
    // Legacy: output pointer omitted from active_lengths (m_vec_mul_add's
    // acc); it is the last pointer argument.
    string outReg = matchRegions.back();
    matchRegions.pop_back();
    M.paramToRegion[outputName] = outReg;
    M.regionToParam[outReg] = outputName;
    M.activeLen[outReg] = L.regions.at(outReg).size();
    cout << "[note] output '" << outputName
         << "' not listed in active_lengths; treating last pointer argument '"
         << outReg << "' as the output\n";
  }

  if (bufferParams.size() != matchRegions.size()) {
    string ps, rs;
    for (auto &p : bufferParams)
      ps += " " + p.first;
    for (auto &r : matchRegions)
      rs += " " + r;
    throw runtime_error(
        "Cannot match parameters to regions positionally: " + activePath +
        " has " + to_string(bufferParams.size()) + " pointer parameter(s) (" +
        ps + " ) but the trace declares " + to_string(matchRegions.size()) +
        " buffer region(s) (" + rs + " )");
  }

  for (size_t i = 0; i < bufferParams.size(); i++) {
    const string &param = bufferParams[i].first;
    const string &region = matchRegions[i];
    long long len = bufferParams[i].second;
    const MemRegion &r = L.regions.at(region);
    if (len <= 0 || len > r.size())
      throw runtime_error("Active length " + to_string(len) + " for '" + param +
                          "' does not fit region '" + region + "' (" +
                          to_string(r.size()) + " bytes)");
    M.paramToRegion[param] = region;
    M.regionToParam[region] = param;
    M.activeLen[region] = len;
    cout << "[map] arg#" << i << " " << param << " -> " << region << " (" << len
         << " active bytes of " << r.size() << ")\n";
  }
  return M;
}

// =====================================================================
// Function spec
// =====================================================================

enum class ArgRole { FixedInput, VariedInput };

struct ResolvedArg {
  string name;
  string param;
  ArgRole role;
  long long start = 0;
  long long length = 0;
  long long fillValue = 0;      // used when the spec gave a single scalar
  vector<long long> fillValues; // per-index values when the spec gave a
                                // full array (e.g. function_inputs/*.json's
                                // real 256-coefficient poly samples);
                                // fillValues[i] takes priority over
                                // fillValue at index i when non-empty
};

struct ResolvedOutput {
  bool scalar = true;
  string label;
  string anchorName;
  long long start = 0;
  long long length = 1;
  long long compareIndex = 0;
  bool hasExpected = false;
  long long expected = 0;
};

struct FunctionSpec {
  string fnName;
  vector<ResolvedArg> args;
  ResolvedOutput out;
  // function_inputs/*.json (the real files, unlike MAYO's GF(16) specs)
  // carries no explicit "q" -- default to KYBER_Q, the modulus of the ring
  // elements most Kyber functions operate over; overridden by an explicit
  // "q" in the spec for functions with a different domain (e.g. small
  // centered-binomial noise, packed bytes 0..255).
  long long fieldSize = 3329;
  bool hasVaried = false;
  bool variedIsScalar = false;
  string variedScalarBase; // e.g. "__mbc_arg_add_f_b"
  long long variedScalarFill = 0;
};
static string find_region_by_prefix(const string &key, const MemoryLayout &L) {
  string found;
  for (auto &n : L.order) {
    if (n.rfind(key, 0) == 0) { // n starts with key
      if (!found.empty())
        return ""; // ambiguous -- refuse to guess
      found = n;
    }
  }
  return found;
}
static string resolve_region_name(const string &key, const ArgMap &M,
                                  const MemoryLayout &L) {
  auto it = M.paramToRegion.find(key);
  if (it != M.paramToRegion.end())
    return it->second;
  if (L.regions.count(key))
    return key;
  string pfx = find_region_by_prefix(key, L);
  if (!pfx.empty())
    return pfx;
  return "";
}

static FunctionSpec load_function_spec(const string &fn, const string &jsonPath,
                                       const MemoryLayout &L,
                                       const string &correct_src,
                                       const ArgMap &M,
                                       const string &variedOverride) {
  JsonObj j = parse_flat_json_first_record(jsonPath);

  FunctionSpec spec;
  spec.fnName = fn;
  const string anchorRegion = "__mbc_ret_anchor_" + fn;

  auto getStr = [&](const string &k, string &dst) {
    const JsonValue *v = json_find(j, k);
    if (!v)
      return false;
    if (!v->isString)
      throw runtime_error("JSON key '" + k + "' must be a string");
    dst = v->s;
    return true;
  };
  auto getInt = [&](const string &k, long long &dst) {
    const JsonValue *v = json_find(j, k);
    if (!v)
      return false;
    if (v->isString)
      throw runtime_error("JSON key '" + k + "' must be an integer");
    dst = v->i;
    return true;
  };

  string outputName;
  if (!getStr("output", outputName))
    throw runtime_error("function_inputs JSON must contain \"output\"");

  string variedName;
  spec.hasVaried = getStr("varied", variedName);
  if (!variedOverride.empty()) {
    if (spec.hasVaried && variedName != variedOverride)
      cout << "[note] varying '" << variedOverride
           << "' from the command line, overriding \"varied\":\"" << variedName
           << "\"\n";
    variedName = variedOverride;
    spec.hasVaried = true;
  }
  string variedRegion =
      spec.hasVaried ? resolve_region_name(variedName, M, L) : "";

  long long clampLength = 0;
  getInt("length", clampLength);
  getInt("q", spec.fieldSize);
  if (spec.fieldSize < 2)
    throw runtime_error("Field size q must be >= 2");

  long long compareIndex = 0;
  getInt("index", compareIndex);

  // Kyber functions operate over several distinct value distributions
  // (full ring elements mod KYBER_Q, small centered-binomial noise, packed
  // bytes, ...), unlike mayo where every function swept the same GF(16).
  // "distribution" is purely documentation -- it has no effect on solving --
  // but it records which distribution "q" below was chosen to cover, so the
  // sweep range for each function can be audited against its actual input
  // domain instead of being silently reused across functions.
  if (const JsonValue *dv = json_find(j, "distribution")) {
    if (dv->kind == JsonValue::KIND_OBJECT)
      for (auto &kv : dv->obj)
        cout << "[distribution] " << kv.first << ": " << kv.second << "\n";
    else if (dv->kind == JsonValue::KIND_STRING)
      cout << "[distribution] " << dv->s << "\n";
  }

  auto lengthFor = [&](const string &region) {
    const MemRegion &r = L.regions.at(region);
    if (clampLength > 0)
      return min(clampLength, r.size());
    auto it = M.activeLen.find(region);
    if (it != M.activeLen.end())
      return it->second;
    return r.size();
  };

  string outRegion = resolve_region_name(outputName, M, L);
  spec.out.label = outputName;
  spec.out.compareIndex = compareIndex;
  bool outIsAnchor = outRegion.empty() || outRegion == anchorRegion;
  if (outIsAnchor) {
    spec.out.scalar = true;
    spec.out.anchorName = anchorRegion;
    spec.out.length = 1;
    spec.out.compareIndex = 0;
  } else {
    const MemRegion &r = L.regions.at(outRegion);
    spec.out.scalar = false;
    spec.out.start = r.start;
    spec.out.length = lengthFor(outRegion);
  }
  {
    const JsonValue *v = json_find(j, outputName);
    if (v && v->kind == JsonValue::KIND_INT) {
      spec.out.hasExpected = true;
      spec.out.expected = v->i;
    }
    // v->kind == KIND_INT_ARRAY (the real function_inputs files store a
    // full sampled output poly under the output's own key) is not an
    // "expected scalar" -- it's just ignored; this query never checks a
    // per-coefficient expected array.
  }
  if (spec.out.compareIndex < 0 || spec.out.compareIndex >= spec.out.length)
    throw runtime_error("\"index\" out of range for output '" + outputName +
                        "'");
  if (spec.hasVaried && !outIsAnchor && variedRegion == outRegion)
    throw runtime_error("Cannot vary '" + variedName + "' -- it is the output");

  static const vector<string> reserved = {"output", "varied",       "length",
                                          "index",  "q",            "distribution",
                                          "params"};
  bool sawVaried = false;
  for (auto &kv : j) {
    const string &key = kv.first;
    if (find(reserved.begin(), reserved.end(), key) != reserved.end())
      continue;
    if (key == outputName || key == anchorRegion)
      continue;

    long long fromTrace = 0;
    string scalarBase;
    if (trace_pinned_scalar(correct_src, key, false, fromTrace))
      scalarBase = key;
    else if (trace_pinned_scalar(correct_src, "__mbc_arg_" + fn + "_" + key,
                                 false, fromTrace))
      scalarBase = "__mbc_arg_" + fn + "_" + key;
    if (!scalarBase.empty()) {
      if (spec.hasVaried && key == variedName) {
        spec.variedIsScalar = true;
        spec.variedScalarBase = scalarBase;
        spec.variedScalarFill = kv.second.isString ? 0 : kv.second.i;
        sawVaried = true;
        cout << "[scalar] " << key << " (" << scalarBase
             << ") marked as VARIED -- trace value " << fromTrace
             << " will be freed, baseline " << spec.variedScalarFill
             << " used for the other 3 trials\n";
        continue;
      }
      if (!kv.second.isString && fromTrace != kv.second.i)
        throw runtime_error(
            "Scalar '" + key + "' is " + to_string(kv.second.i) + " in " +
            jsonPath + " but " + to_string(fromTrace) +
            " in the trace -- stale function_inputs file?"); // unchanged
      cout << "[scalar] " << key << " = " << fromTrace << " (pinned as "
           << scalarBase << ")\n";
      continue;
    }
    string region = resolve_region_name(key, M, L);
    if (!region.empty()) {
      if (kv.second.kind == JsonValue::KIND_STRING ||
          kv.second.kind == JsonValue::KIND_OBJECT)
        throw runtime_error("Input '" + key +
                            "' must be an integer or an array of integers");
      const MemRegion &r = L.regions.at(region);
      ResolvedArg a;
      a.name = region;
      auto pit = M.regionToParam.find(region);
      a.param = pit != M.regionToParam.end() ? pit->second : region;
      a.role = (spec.hasVaried && region == variedRegion) ? ArgRole::VariedInput
                                                          : ArgRole::FixedInput;
      if (a.role == ArgRole::VariedInput)
        sawVaried = true;
      a.start = r.start;
      a.length = lengthFor(region);
      if (kv.second.kind == JsonValue::KIND_INT_ARRAY) {
        // The real function_inputs/*.json files give a full sampled
        // per-coefficient array rather than one scalar fill value --
        // fillValues[i] is used at index i instead of a repeated constant.
        if ((long long)kv.second.arr.size() != a.length)
          throw runtime_error(
              "Input '" + key + "' array has " +
              to_string(kv.second.arr.size()) + " element(s) but region '" +
              region + "' expects " + to_string(a.length));
        a.fillValues = kv.second.arr;
        a.fillValue = a.fillValues.empty() ? 0 : a.fillValues[0];
      } else {
        a.fillValue = kv.second.i;
      }
      spec.args.push_back(a);
      continue;
    }

    string known;
    for (auto &n : L.order)
      known += " " + n;
    throw runtime_error("JSON key '" + key +
                        "' is neither a trace-pinned scalar nor a known "
                        "parameter/region. Regions:" +
                        known);
  }

  if (spec.hasVaried && !sawVaried) {
    string inputs;
    for (auto &a : spec.args)
      inputs += " " + a.param + "(" + a.name + ")";
    throw runtime_error("'" + variedName +
                        "' does not name an input. Inputs:" + inputs);
  }
  if (spec.args.empty())
    throw runtime_error("No input regions found in " + jsonPath);

  if (!spec.hasVaried && spec.args.size() == 1) {
    // No "varied" input was named (neither "varied" in the JSON spec nor
    // --varied on the command line), and there is exactly one array
    // argument -- e.g. poly_tomsg's lone "a". With only one input there
    // is nothing else it could sensibly be held fixed against, so it IS
    // the only thing an ineffective/correction sweep can vary. Default
    // to varying it automatically instead of requiring every
    // single-input function's function_inputs/*.json to spell out
    // "varied" for what is otherwise the only possible choice.
    spec.args[0].role = ArgRole::VariedInput;
    spec.hasVaried = true;
    cout << "[note] no \"varied\" input specified and '" << spec.args[0].param
         << "' is the only input -- auto-varying it\n";
  }

  std::sort(spec.args.begin(), spec.args.end(),
            [](const ResolvedArg &a, const ResolvedArg &b) {
              return a.start < b.start;
            });
  for (size_t i = 0; i + 1 < spec.args.size(); i++)
    if (spec.args[i].start + spec.args[i].length > spec.args[i + 1].start)
      throw runtime_error("Inputs '" + spec.args[i].name + "' and '" +
                          spec.args[i + 1].name + "' overlap in memory");

  return spec;
}

// =====================================================================
// Per-value check, run in its own thread with its own z3::context.
// z3::context/solver/expr are NOT safe to share across threads -- each
// thread builds its own context, re-parses the four .smt2 files (already
// written to disk once, single-threaded, before any threads start), and
// rebuilds every constraint from scratch. Everything that needs to
// survive past the thread's lifetime gets copied out into plain
// long long/string/vector fields on ValueResult -- no z3::expr or
// z3::model leaks out.
// =====================================================================

struct FixedEntry {
  string name;
  vector<long long> vals;
};
struct VariedEntry {
  string name;
  vector<long long> v1, v2;
};

struct ValueResult {
  int value = -1;
  bool attempted = false; // false if skipped because SAT was already found
                          // elsewhere -- distinct from a genuine Z3 unknown
  check_result res = unknown;
  long long c1v = 0, f1v = 0, c2v = 0, f2v = 0;
  vector<FixedEntry> fixedVals;
  vector<VariedEntry> variedVals;
  vector<long long> out1_correct, out1_faulty, out2_correct, out2_faulty;
};

static ValueResult
check_value(int value, const FunctionSpec &spec, const string &c1,
            const string &f1, const string &c2, const string &f2,
            const vector<string> &inputMemC, const vector<string> &inputMemF,
            const string &anchC, const string &anchF, const string &finalMemC,
            const string &finalMemF, const vector<string> &anonC,
            const vector<string> &anonF, mutex &ctxMutex,
            vector<context *> &activeCtx, unsigned workerSlot,
            const atomic<bool> &stopRequested) {
  ValueResult out;
  out.value = value;

  if (stopRequested.load(memory_order_acquire))
    return out; // another worker already found SAT; don't bother starting
  out.attempted = true;

  context ctx; // thread-local -- never shared

  // Register this thread's context so the worker that finds SAT can
  // interrupt every other in-flight solve instead of waiting for the
  // (up to 20s) per-value timeout to expire on its own.
  {
    lock_guard<mutex> lk(ctxMutex);
    activeCtx[workerSlot] = &ctx;
  }
  struct Unregister {
    mutex &m;
    vector<context *> &a;
    unsigned w;
    ~Unregister() {
      lock_guard<mutex> lk(m);
      a[w] = nullptr;
    }
  } unregisterGuard{ctxMutex, activeCtx, workerSlot};

  tactic simp = z3::tactic(ctx, "simplify");
  tactic eqs = z3::tactic(ctx, "solve-eqs");
  tactic prop = z3::tactic(ctx, "propagate-values");
  tactic core = z3::tactic(ctx, "smt");
  tactic pipeline = simp & prop & eqs & core;
  solver slv = pipeline.mk_solver();

  params p(ctx);
  p.set("timeout", 20000u); // per value, in its own thread
  slv.set(p);

  expr_vector C1 = ctx.parse_file(c1.c_str());
  expr_vector F1 = ctx.parse_file(f1.c_str());
  expr_vector C2 = ctx.parse_file(c2.c_str());
  expr_vector F2 = ctx.parse_file(f2.c_str());
  for (expr e : C1)
    slv.add(e);
  for (expr e : F1)
    slv.add(e);
  for (expr e : C2)
    slv.add(e);
  for (expr e : F2)
    slv.add(e);

  for (auto &base : anonC) {
    for (const char *tag : {"C1", "C2"}) {
      expr v = ctx.int_const((base + "_" + tag).c_str());
      slv.add(v >= ctx.int_val(0) && v <= ctx.int_val(1));
    }
  }
  for (auto &base : anonF) {
    for (const char *tag : {"F1", "F2"}) {
      expr v = ctx.int_const((base + "_" + tag).c_str());
      slv.add(v >= ctx.int_val(0) && v <= ctx.int_val(1));
    }
  }

  z3::sort arr_sort = ctx.array_sort(ctx.int_sort(), ctx.int_sort());
  auto mem = [&](const string &sym, const string &tag) {
    return ctx.constant((sym + "_" + tag).c_str(), arr_sort);
  };

  vector<expr> inputC1, inputF1, inputC2, inputF2;
  for (const string &sym : inputMemC) {
    inputC1.push_back(mem(sym, "C1"));
    inputC2.push_back(mem(sym, "C2"));
  }
  for (const string &sym : inputMemF) {
    inputF1.push_back(mem(sym, "F1"));
    inputF2.push_back(mem(sym, "F2"));
  }

  expr sweepVar = ctx.int_val(0);
  bool haveSweepVar = false;

  auto constrain_args = [&](const vector<expr> &mems, const string &execTag,
                            bool isCorrectExecution) {
    if (mems.empty())
      throw runtime_error("No input memory selected for " + execTag);

    for (auto &a : spec.args) {
      // Real function_inputs/*.json gives a full per-coefficient sample
      // array rather than one repeated scalar; fillAt reads that when
      // present so the "held fixed" coefficients use realistic values
      // instead of all-zero.
      auto fillAt = [&](long long i) {
        return a.fillValues.empty() ? a.fillValue : a.fillValues[i];
      };
      for (long long i = 0; i < a.length; i++) {
        expr addr = ctx.int_val((int)(a.start + i));

        if (a.role == ArgRole::FixedInput) {
          expr vi = ctx.int_const((a.name + "_" + to_string(i)).c_str());
          for (const expr &mm : mems)
            slv.add(select(mm, addr) == vi);
          slv.add(vi == ctx.int_val((int)fillAt(i)));
        } else {
          // C1/F1 share inputs; C2/F2 share inputs.
          const bool trial1 = (execTag == "C1" || execTag == "F1");
          const string suffix = trial1 ? "_1_" : "_2_";
          expr oi = ctx.int_const((a.name + suffix + to_string(i)).c_str());
          for (const expr &mm : mems)
            slv.add(select(mm, addr) == oi);
          // Only the ACTUALLY-swept coefficient (trial1, i==0) gets the
          // [0, fieldSize) sweep-domain bound. Every other coefficient of
          // a VariedInput arg is just being held at its real sampled
          // value below, which -- for an unreduced poly like poly_add's
          // inputs -- can be negative; asserting oi>=0 on those too
          // makes the whole formula UNSAT regardless of the swept value.
          if (trial1 && i == 0) {
            if (!haveSweepVar) {
              slv.add(oi >= ctx.int_val(0));
              slv.add(oi < ctx.int_val((int)spec.fieldSize));
              sweepVar = oi;
              haveSweepVar = true;
            }
          } else {
            slv.add(oi == ctx.int_val((int)fillAt(i)));
          }
        }
      }
    }
  };

  constrain_args(inputC1, "C1", true);
  constrain_args(inputF1, "F1", false);
  constrain_args(inputC2, "C2", true);
  constrain_args(inputF2, "F2", false);

  if (!haveSweepVar)
    throw runtime_error("No VariedInput arg found to sweep over");

  expr finC1 = mem(finalMemC, "C1");
  expr finF1 = mem(finalMemF, "F1");
  expr finC2 = mem(finalMemC, "C2");
  expr finF2 = mem(finalMemF, "F2");

  expr c1v = ctx.int_val(0), f1v = ctx.int_val(0);
  expr c2v = ctx.int_val(0), f2v = ctx.int_val(0);

  if (spec.out.scalar) {
    c1v = ctx.int_const((anchC + "_C1").c_str());
    f1v = ctx.int_const((anchF + "_F1").c_str());
    c2v = ctx.int_const((anchC + "_C2").c_str());
    f2v = ctx.int_const((anchF + "_F2").c_str());
  } else {
    expr addr = ctx.int_val((int)(spec.out.start + spec.out.compareIndex));
    c1v = select(finC1, addr);
    f1v = select(finF1, addr);
    c2v = select(finC2, addr);
    f2v = select(finF2, addr);
  }

  // Ineffective-fault condition: fault masked in trial 1.
  slv.add(sweepVar == ctx.int_val(value));
  slv.add(c1v == f1v);
  // slv.add(c2v != f2v); // ... and observable in trial 2

  // if(value == 1){
  //   cout << c1v << f1v << c2v << f2v;
  //   cout << "\nValues for sweep";
  // }
  out.res = slv.check();
  if (out.res != sat)
    return out;

  model m = slv.get_model();
  out.c1v = eval_i64(m, c1v);
  out.f1v = eval_i64(m, f1v);
  out.c2v = eval_i64(m, c2v);
  out.f2v = eval_i64(m, f2v);

  for (auto &a : spec.args) {
    if (a.role == ArgRole::FixedInput) {
      FixedEntry fe{a.name, {}};
      for (long long i = 0; i < a.length; i++)
        fe.vals.push_back(
            eval_i64(m, ctx.int_const((a.name + "_" + to_string(i)).c_str())));
      out.fixedVals.push_back(fe);
    } else {
      VariedEntry ve{a.name, {}, {}};
      for (long long i = 0; i < a.length; i++) {
        ve.v1.push_back(eval_i64(
            m, ctx.int_const((a.name + "_1_" + to_string(i)).c_str())));
        ve.v2.push_back(eval_i64(
            m, ctx.int_const((a.name + "_2_" + to_string(i)).c_str())));
      }
      out.variedVals.push_back(ve);
    }
  }

  if (spec.out.scalar) {
    out.out1_correct.push_back(out.c1v);
    out.out1_faulty.push_back(out.f1v);
    out.out2_correct.push_back(out.c2v);
    out.out2_faulty.push_back(out.f2v);
  } else {
    for (long long i = 0; i < spec.out.length; i++) {
      expr a = ctx.int_val((int)(spec.out.start + i));
      out.out1_correct.push_back(eval_i64(m, select(finC1, a)));
      out.out1_faulty.push_back(eval_i64(m, select(finF1, a)));
      out.out2_correct.push_back(eval_i64(m, select(finC2, a)));
      out.out2_faulty.push_back(eval_i64(m, select(finF2, a)));
    }
  }

  return out;
}

static bool ends_with(const string &s, const string &suf) {
  return s.size() >= suf.size() &&
         s.compare(s.size() - suf.size(), suf.size(), suf) == 0;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    cerr << "Usage: ./ineffective_query <fnName> [variedInput] "
            "[function_inputs.json]\n"
            "  e.g. ./ineffective_query lincomb x\n";
    return 1;
  }
  string fn = argv[1];

  string variedOverride, spec_path;
  for (int i = 2; i < argc; i++) {
    string a = argv[i];
    if (ends_with(a, ".json") || a.find('/') != string::npos) {
      if (!spec_path.empty()) {
        cerr << "Two spec files given: " << spec_path << " and " << a << "\n";
        return 1;
      }
      spec_path = a;
    } else {
      if (!variedOverride.empty()) {
        cerr << "Only one input can be varied (got '" << variedOverride
             << "' and '" << a << "')\n";
        return 1;
      }
      variedOverride = a;
    }
  }
  if (spec_path.empty())
    spec_path = "../../../function_inputs/" + kyber_base_name(fn) + ".json";

  string fn_path = "../../tests_kyber/" + fn + "/";
  string correct_path = fn_path + fn + ".smt2";
  // Fault traces are split across three categories emitted by the
  // injection pipeline; collect .smt2 files from every one that exists
  // rather than hardcoding a single directory.
  static const vector<string> faultDirNames = {"loopOrFuncSkip", "binOpFault",
                                               "loadStoreSkip"};
  string active_path = fn_path + "active_lengths.json";

  vector<string> faultyCandidates;
  for (const string &dirName : faultDirNames) {
    string dir = fn_path + dirName + "/";
    if (!fs::exists(dir) || !fs::is_directory(dir))
      continue;
    for (const auto &entry : fs::directory_iterator(dir))
      if (entry.is_regular_file() && entry.path().extension() == ".smt2")
        faultyCandidates.push_back(entry.path().string());
  }
  if (faultyCandidates.empty()) {
    cerr << "No .smt2 files found in any of:";
    for (auto &d : faultDirNames)
      cerr << " " << fn_path + d + "/";
    cerr << "\n";
    return 1;
  }
  std::sort(faultyCandidates.begin(), faultyCandidates.end());

  cout << "[+] correct trace:  " << correct_path << "\n";
  cout << "[+] spec:           " << spec_path << "\n";
  cout << "[+] active lengths: " << active_path << "\n";
  cout << "[+] faulty traces found (" << faultyCandidates.size() << "):\n";
  for (auto &p : faultyCandidates)
    cout << "    " << p << "\n";
  if (!variedOverride.empty())
    cout << "[+] varying:        " << variedOverride << "\n";

  string correct_raw = read_file(correct_path);
  MemoryLayout layoutC = parse_layout(correct_raw);
  print_layout(layoutC, "correct");

  string outputName;
  string outputRegionExclude;
  vector<string> paramOrder;
  {
    JsonObj peek = parse_flat_json_first_record(spec_path);
    const JsonValue *v = json_find(peek, "output");
    if (v && v->isString) {
      outputName = v->s;
    }
    // function_inputs has no explicit parameter-declaration order, but
    // every Kyber ref function puts the output pointer first, and
    // active_lengths.json (a separate tool's output) lists the remaining
    // pointer params in declaration order -- so [output] + those keys
    // reconstructs the full order without needing a new spec field.
    if (!outputName.empty()) {
      paramOrder.push_back(outputName);
      if (fs::exists(active_path)) {
        JsonObj act = parse_flat_json(read_file(active_path));
        for (auto &kv : act)
          paramOrder.push_back(kv.first);
      }
      cout << "[+] params (output-first, then active_lengths order):";
      for (auto &p : paramOrder)
        cout << " " << p;
      cout << "\n";
    }
  }
  // cerr << "\n[DEBUG] BEFORE build_arg_map\n";

  ArgMap argMap = build_arg_map(fn, active_path, layoutC, correct_raw,
                                outputName, paramOrder);

  // cerr << "[DEBUG] AFTER build_arg_map\n";

  FunctionSpec spec = load_function_spec(fn, spec_path, layoutC, correct_raw,
                                         argMap, variedOverride);

  // cerr << "[DEBUG] AFTER load_function_spec\n";
  for (auto &a : spec.args) {
    string desc;
    if (a.role != ArgRole::FixedInput)
      desc = "varied";
    else if (!a.fillValues.empty())
      desc = "fixed=<array of " + to_string(a.fillValues.size()) +
             " sampled value(s), e.g. " + to_string(a.fillValues[0]) + ">";
    else
      desc = "fixed=" + to_string(a.fillValue);
    cout << "[arg] " << a.param << " (" << a.name << ") " << desc << " ["
         << a.start << ".." << a.start + a.length - 1 << "]\n";
  }
  if (spec.out.scalar)
    cout << "[out] scalar via anchor " << spec.out.anchorName << "\n";
  else
    cout << "[out] " << spec.out.label << " [" << spec.out.start << ".."
         << spec.out.start + spec.out.length - 1 << "], compare byte "
         << spec.out.start + spec.out.compareIndex << "\n";

  string correct_src = strip_bad_asserts(strip_last_assert(correct_raw));
  if (spec.variedIsScalar)
    correct_src = strip_scalar_pin(correct_src, spec.variedScalarBase, false);
  string anchC;
  vector<string> inputMemC;
  string variedScalarSymC;
  if (spec.variedIsScalar)
    variedScalarSymC =
        resolve_final_ssa_symbol(correct_src, spec.variedScalarBase, false);
  if (spec.out.scalar) {
    anchC = resolve_final_ssa_symbol(correct_src, spec.out.anchorName, false);
    inputMemC = find_anchor_read_memories(correct_src, anchC);
    cout << "[mem] scalar anchor (correct): " << anchC << "\n";
    cout << "[mem] scalar reads correct:";
    for (const string &m : inputMemC)
      cout << " " << m;
    cout << "\n";
  } else {
    inputMemC.push_back(layoutC.finalMem);
    cout << "[mem] array output/input constraints on Final_Memory (correct): "
         << layoutC.finalMem << "\n";
  }

  vector<string> anonC = find_anonymous_int_temps(correct_src);
  if (!anonC.empty())
    cout << "[assume] " << anonC.size()
         << " anonymous temporary(ies) in the correct trace with no "
            "defining equation (e.g. "
         << anonC.front()
         << ") are constrained to {0,1} -- the \"multiply by one bit\" "
            "idiom seen at their use sites. This is an ASSUMPTION about "
            "trace semantics, not something derived from the file; verify "
            "against ground truth if results look wrong.\n";

  string c1 = write_suffixed(correct_src, "C1", fn_path);
  string c2 = write_suffixed(correct_src, "C2", fn_path);

  // ---- one full solve per faulty candidate in loopOrFuncSkip/, each of
  //      which spawns one thread per sweep value 0..fieldSize-1 ----
  for (const string &faulty_path : faultyCandidates) {
    string tag = fs::path(faulty_path).stem().string();
    cout << "\n########################################\n";
    cout << "# faulty trace: " << faulty_path << "\n";
    cout << "########################################\n";

    string faulty_raw = read_file(faulty_path);
    MemoryLayout layoutF = parse_layout(faulty_raw);
    check_layouts_match(layoutC, layoutF);
    print_layout(layoutF, "faulty");

    string faulty_src = strip_bad_asserts(strip_last_assert(faulty_raw));
    if (spec.variedIsScalar)
      faulty_src = strip_scalar_pin(faulty_src, spec.variedScalarBase, true);
    string variedScalarSymF;
    if (spec.variedIsScalar)
      variedScalarSymF =
          resolve_final_ssa_symbol(faulty_src, spec.variedScalarBase, true);
    if (traces_structurally_identical(correct_src, faulty_src)) {
      cout << "[!] WARNING: once _correct/_faulty labels are normalized "
              "away, this faulty trace is IDENTICAL to the correct trace "
              "(same formula, same internal SSA numbering). The fault "
              "does not appear to be encoded in this SMT file at all -- "
              "any SAT/UNSAT result below is a property of that identity, "
              "not of the actual fault. Check the trace-generation "
              "pipeline for this fault site, not this query.\n";
    }

    string anchF;
    vector<string> inputMemF;
    if (spec.out.scalar) {
      anchF = resolve_final_ssa_symbol(faulty_src, spec.out.anchorName, true);
      inputMemF = find_anchor_read_memories(faulty_src, anchF);
      cout << "[mem] scalar anchor (faulty): " << anchF << "\n";
      cout << "[mem] scalar reads faulty:";
      for (const string &m : inputMemF)
        cout << " " << m;
      cout << "\n";
    } else {
      inputMemF.push_back(layoutF.finalMem);
    }

    vector<string> anonF = find_anonymous_int_temps(faulty_src);
    if (!anonF.empty())
      cout << "[assume] " << anonF.size()
           << " anonymous temporary(ies) in the faulty trace similarly "
              "constrained to {0,1}\n";

    string f1 = write_suffixed(faulty_src, "F1", fn_path);
    string f2 = write_suffixed(faulty_src, "F2", fn_path);

    if (spec.args.empty() ||
        find_if(spec.args.begin(), spec.args.end(), [](const ResolvedArg &a) {
          return a.role == ArgRole::VariedInput;
        }) == spec.args.end()) {
      // No input to sweep -- fall back to a single-threaded concrete check.
      cout << "[note] no input to vary -- running a single fully-concrete "
              "check instead of a threaded sweep.\n";
      mutex soloCtxMutex;
      vector<context *> soloActiveCtx(1, nullptr);
      atomic<bool> soloStop{false};
      ValueResult r = check_value(0, spec, c1, f1, c2, f2, inputMemC,
                                  inputMemF, anchC, anchF, layoutC.finalMem,
                                  layoutF.finalMem, anonC, anonF, soloCtxMutex,
                                  soloActiveCtx, 0, soloStop);
      cout << (r.res == sat     ? "SAT!\n"
               : r.res == unsat ? "UNSAT\n"
                                : "UNKNOWN\n");
      continue;
    }

    // The sweep range ("q") can be the full KYBER_Q ring (3329), far too
    // large to spawn one OS thread per value as MAYO's GF(16) design did.
    // Instead run a bounded pool of nproc() workers pulling from a shared
    // work queue; as soon as any value comes back SAT, every other
    // in-flight solve is interrupted (via z3::context::interrupt) and no
    // new values are started -- we only need ONE ineffective-fault witness,
    // not an exhaustive sweep.
    unsigned numWorkers = std::thread::hardware_concurrency();
    if (numWorkers == 0)
      numWorkers = 1;
    numWorkers = (unsigned)min<long long>(numWorkers, spec.fieldSize);

    cout << "Sweeping " << spec.fieldSize << " value(s) [0.."
         << spec.fieldSize - 1 << "] with a pool of " << numWorkers
         << " worker thread(s) (nproc); stopping and interrupting every "
            "other in-flight solve as soon as one value comes back SAT.\n";

    vector<ValueResult> results(spec.fieldSize);
    atomic<long long> nextValue{0};
    atomic<bool> foundSat{false};
    atomic<int> satFoundValue{-1};
    mutex ctxMutex;
    vector<context *> activeCtx(numWorkers, nullptr);

    vector<std::thread> threads;
    threads.reserve(numWorkers);
    for (unsigned w = 0; w < numWorkers; w++) {
      threads.emplace_back([&, w]() {
        while (!foundSat.load(memory_order_acquire)) {
          long long v = nextValue.fetch_add(1);
          if (v >= spec.fieldSize)
            break;
          ValueResult r;
          try {
            r = check_value((int)v, spec, c1, f1, c2, f2, inputMemC,
                             inputMemF, anchC, anchF, layoutC.finalMem,
                             layoutF.finalMem, anonC, anonF, ctxMutex,
                             activeCtx, w, foundSat);
          } catch (const z3::exception &) {
            // Another worker already found SAT and called
            // activeCtx[w]->interrupt() on this thread's in-flight
            // solve (below) -- z3 reports that as a thrown exception
            // from slv.check(), not a plain `unknown` check_result.
            // An exception escaping a std::thread's entry function
            // calls std::terminate() and aborts the ENTIRE process, so
            // it must be caught here: treat a cancelled solve the same
            // as an uninteresting/unattempted candidate.
            r.value = (int)v;
            r.attempted = true;
            r.res = unknown;
          }
          results[v] = r;
          if (r.res == sat) {
            bool expected = false;
            if (foundSat.compare_exchange_strong(expected, true)) {
              satFoundValue.store((int)v, memory_order_release);
              lock_guard<mutex> lk(ctxMutex);
              for (unsigned i = 0; i < activeCtx.size(); i++)
                if (i != w && activeCtx[i])
                  activeCtx[i]->interrupt();
            }
          }
        }
      });
    }
    for (auto &t : threads)
      t.join();

    // ---- Aggregate + print (single-threaded again) ----
    vector<int> satValues, unsatValues, unknownValues;
    long long attemptedCount = 0;
    for (auto &r : results) {
      if (!r.attempted)
        continue;
      attemptedCount++;
      if (r.res == sat)
        satValues.push_back(r.value);
      else if (r.res == unsat)
        unsatValues.push_back(r.value);
      else
        unknownValues.push_back(r.value);
    }

    for (auto &r : results) {
      if (r.res != sat)
        continue;
      cout << "\n================ value " << r.value
           << " (SAT) ================\n";
      cout << "  correct[1] = " << r.c1v << "  faulty[1] = " << r.f1v << "\n";
      cout << "  correct[2] = " << r.c2v << "  faulty[2] = " << r.f2v << "\n";
      if (spec.out.hasExpected) {
        long long got = r.out1_correct[spec.out.compareIndex];
        if (got != spec.out.expected)
          cout << "  [!] expected " << spec.out.label << "["
               << spec.out.compareIndex << "] = " << spec.out.expected
               << " per function_inputs, got " << got
               << " from the correct trace\n";
      }
    }

    cout << "\n================ SWEEP SUMMARY (" << tag
         << ") ================\n";
    cout << "Attempted " << attemptedCount << " of " << spec.fieldSize
         << " value(s) before stopping.\n";
    cout << "SAT for values:";
    for (int v : satValues)
      cout << " " << v;
    cout << "\n";
    cout << "UNSAT for values:";
    for (int v : unsatValues)
      cout << " " << v;
    cout << "\n";
    if (!unknownValues.empty()) {
      cout << "UNKNOWN/TIMEOUT for values:";
      for (int v : unknownValues)
        cout << " " << v;
      cout << "\n[!] some attempted values could not be decided within the "
              "timeout.\n";
    }
    if (!satValues.empty() && attemptedCount > 1 &&
        (long long)satValues.size() == attemptedCount)
      cout << "[!] every value attempted before stopping was SAT -- the "
              "compared outputs are probably not determined by the seeded "
              "inputs; check the seed point, or whether this faulty trace "
              "actually differs from the correct one.\n";

    if (satValues.empty()) {
      if (attemptedCount == spec.fieldSize)
        cout << "No SAT value found after exhausting all " << spec.fieldSize
             << " value(s).\n";
      else
        cout << "No SAT value found (search did not finish -- see "
                "UNKNOWN/TIMEOUT above).\n";
      continue;
    }
    cout << "[+] stopped early after finding SAT at value "
         << satFoundValue.load() << " -- "
         << (spec.fieldSize - attemptedCount) << " value(s) left unexplored.\n";

    string witness_path = fn_path + "ineffective_smt_witness_" + tag + ".json";
    ofstream wj(witness_path);
    wj << "{\n";
    wj << "  \"function\": \"" << fn << "\",\n";
    wj << "  \"fault\": \"" << tag << "\",\n";
    wj << "  \"sat_values\": "
       << json_arr(vector<long long>(satValues.begin(), satValues.end()))
       << "\n";
    // wj << "  \"trials\": [\n";
    // bool firstTrial = true;
    // for (auto &r : results) {
    //   if (r.res != sat)
    //     continue;

    //   auto writeInputsObj =
    //       [&](std::function<vector<long long>(VariedEntry &)> pick) {
    //         wj << "        \"inputs\": {\n";
    //         bool ifirst = true;
    //         for (auto &fe : r.fixedVals) {
    //           wj << (ifirst ? "          " : ",\n          ") << "\""
    //              << fe.name << "\": " << json_arr(fe.vals);
    //           ifirst = false;
    //         }
    //         for (auto &ve : r.variedVals) {
    //           wj << (ifirst ? "          " : ",\n          ") << "\""
    //              << ve.name << "\": " << json_arr(pick(ve));
    //           ifirst = false;
    //         }
    //         wj << "\n        }";
    //       };

    //   wj << (firstTrial ? "    {\n" : ",\n    {\n");
    //   wj << "      \"sweep_value\": " << r.value << ",\n";
    //   wj << "      \"exec1_ineffective\": {\n";
    //   writeInputsObj([](VariedEntry &ve) { return ve.v1; });
    //   wj << ",\n";
    //   wj << "        \"expected\": {\n";
    //   wj << "          \"" << spec.out.label
    //      << "_correct\": " << json_arr(r.out1_correct) << ",\n";
    //   wj << "          \"" << spec.out.label
    //      << "_faulty\": " << json_arr(r.out1_faulty) << "\n";
    //   wj << "        }\n";
    //   wj << "      },\n";
    //   wj << "      \"exec2\": {\n";
    //   writeInputsObj([](VariedEntry &ve) { return ve.v2; });
    //   wj << ",\n";
    //   wj << "        \"expected\": {\n";
    //   wj << "          \"" << spec.out.label
    //      << "_correct\": " << json_arr(r.out2_correct) << ",\n";
    //   wj << "          \"" << spec.out.label
    //      << "_faulty\": " << json_arr(r.out2_faulty) << "\n";
    //   wj << "        }\n";
    //   wj << "      }\n";
    //   wj << "    }";
    //   firstTrial = false;
    // }
    // wj << "\n  ]\n";
    wj << "}\n";
    cout << "[+] witness exported to " << witness_path << "\n";
  }

  return 0;
}