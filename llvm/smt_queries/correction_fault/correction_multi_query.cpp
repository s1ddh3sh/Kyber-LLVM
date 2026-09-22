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
// File-text utilities (kept in sync with ineffective_query.cpp)
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

// Only ONE copy of each trace is needed here (tag "C" for correct, "F" for
// faulty) -- a correction attack is a single faulty execution plus a single
// correction, not a two-execution differential.
//
// NOTE the trailing `*` (was `+`): llvmbmc emits anonymous temporaries named
// `i_7_`, `i_12_`, ... with nothing after the final underscore. With `+`
// those names were left UNSUFFIXED, so the C and F copies collapsed onto the
// same Z3 constant and were silently forced equal across the two executions.
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

static unsigned bits_for_field(long long fieldSize) {
  unsigned bits = 1;
  while ((1LL << bits) < fieldSize)
    bits++;
  return bits;
}

// llvmbmc's SMT-LIB printer emits some intermediates as anonymous integer
// temporaries -- `(declare-fun i_7_ () Int)` with nothing after the final
// underscore -- and never writes a defining equation for them. In lincomb
// these appear as `(* i_42_ (select mem addr))` inside a conditional-XOR
// chain: the "multiply by one bit of the GF(16) multiplier, else 0" idiom
// from schoolbook double-and-add multiplication. Bounding them to {0,1} is
// an ASSUMPTION about their meaning, stated explicitly and printed at
// runtime -- if wrong for a given function, its results should be treated
// as unverified until the upstream trace emits real defining equations.
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
  string initialMem; // diagnostic only; never used as the query seed
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
    MemRegion r;
    r.name = (*it)[1].str();
    r.start = stoll((*it)[2].str());
    r.end = stoll((*it)[3].str());
    if (r.end < r.start)
      throw runtime_error("Malformed region for '" + r.name + "'");
    if (!L.regions.count(r.name))
      L.order.push_back(r.name);
    L.regions[r.name] = r;
  }

  if (L.regions.empty())
    throw runtime_error("No ';; Array <name> <start> <end>' comments found");

  try {
    L.initialMem = parse_tagged_symbol(src, "Initial_Memory");
  } catch (...) {
    L.initialMem.clear();
  }

  L.finalMem = parse_tagged_symbol(src, "Final_Memory");
  return L;
}

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

  regex re(R"(\(select\s+(c_\d+_[A-Za-z0-9_.]+)\s+)");
  set<string> seen;
  vector<string> result;

  for (auto it = sregex_iterator(block.begin(), block.end(), re),
            e = sregex_iterator();
       it != e; ++it) {
    string mem = (*it)[1].str();
    if (seen.insert(mem).second)
      result.push_back(mem);
  }

  if (result.empty())
    throw runtime_error("The defining assert for '" + anchorSym +
                        "' reads no memory SSA version via select(...)");

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
  cout << "[layout:" << which << "] final=" << L.finalMem;
  if (!L.initialMem.empty())
    cout << " (Initial_Memory=" << L.initialMem << ")";
  cout << "\n";
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

static bool trace_pinned_scalar(const string &src, const string &base,
                                bool faulty, long long &out) {
  string suffix = faulty ? "_faulty" : "_correct";
  regex re("\\(assert\\s*\\(=\\s*i_\\d+_" + base + suffix +
           "\\s+(-?\\d+)\\)\\)");
  smatch m;
  if (!regex_search(src, m, re))
    return false;
  out = stoll(m[1].str());
  return true;
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
// function_inputs files store full per-coefficient poly data this way), or
// a flat string-valued {..} object (only used for "distribution":{...}).
// Not a general recursive JSON parser -- nested arrays/objects beyond this
// one level are not needed by any function_inputs file in this repo.
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
        size_t st = i;
        if (i < text.size() && (text[i] == '-' || text[i] == '+'))
          i++;
        while (i < text.size() && isdigit((unsigned char)text[i]))
          i++;
        if (st == i)
          throw runtime_error("JSON: expected an integer in array");
        v.arr.push_back(stoll(text.substr(st, i - st)));
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
// argument's real distribution. This query needs exactly one fixed
// scenario, so it takes the first well-formed line.
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
// tool's output) names files after the bare function name.
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

// See ineffective_multi_query.cpp's build_arg_map_from_param_order: Kyber's
// harness allocates one buffer per pointer PARAMETER in C declaration order
// (output included), so the function_inputs spec names the full order via
// "params":"r,a,b" and this zips it 1:1 against the trace's buffer regions
// in ascending address order. active_lengths.json gives lengths in BYTES,
// while the trace addresses memory per element -- a byte length that evenly
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
          activeLen = r.size();
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
                            const string &outputRegionExclude,
                            const vector<string> &paramOrder) {
  vector<string> bufferRegions;
  for (auto &n : L.order)
    if (!is_internal_region(n, fn, src) &&
        (paramOrder.empty() ? n != outputRegionExclude : true))
      bufferRegions.push_back(n);

  if (!paramOrder.empty())
    return build_arg_map_from_param_order(activePath, L, bufferRegions,
                                          paramOrder);

  ArgMap M;

  if (!fs::exists(activePath)) {
    cout << "[note] no " << activePath
         << " -- using region names as-is and full region lengths\n";
    for (auto &n : bufferRegions) {
      M.paramToRegion[n] = n;
      M.regionToParam[n] = n;
    }
    return M;
  }

  JsonObj act = parse_flat_json(read_file(activePath));

  vector<pair<string, long long>> bufferParams;
  for (auto &kv : act) {
    if (kv.second.isString)
      throw runtime_error("active_lengths: '" + kv.first +
                          "' must be an integer");
    long long dummy;
    bool isScalar = L.regions.count("__mbc_arg_" + fn + "_" + kv.first) ||
                    trace_pinned_scalar(src, "__mbc_arg_" + fn + "_" + kv.first,
                                        false, dummy);
    if (isScalar) {
      M.paramToRegion[kv.first] = "__mbc_arg_" + fn + "_" + kv.first;
      continue;
    }
    bufferParams.push_back({kv.first, kv.second.i});
  }

  if (bufferParams.size() != bufferRegions.size()) {
    string ps, rs;
    for (auto &p : bufferParams)
      ps += " " + p.first;
    for (auto &r : bufferRegions)
      rs += " " + r;
    throw runtime_error(
        "Cannot match parameters to regions positionally: " + activePath +
        " has " + to_string(bufferParams.size()) + " buffer parameter(s) (" +
        ps + " ) but the trace declares " + to_string(bufferRegions.size()) +
        " buffer region(s) (" + rs + " )");
  }

  for (size_t i = 0; i < bufferParams.size(); i++) {
    const string &param = bufferParams[i].first;
    const string &region = bufferRegions[i];
    M.paramToRegion[param] = region;
    M.regionToParam[region] = param;
    long long len = bufferParams[i].second;
    const MemRegion &r = L.regions.at(region);
    if (len <= 0 || len > r.size())
      throw runtime_error("Active length " + to_string(len) + " for '" + param +
                          "' does not fit region '" + region + "' (" +
                          to_string(r.size()) + " bytes)");
    M.activeLen[region] = len;
    cout << "[map] " << param << " -> " << region << " (" << len
         << " active bytes of " << r.size() << ")\n";
  }
  return M;
}

// =====================================================================
// Function spec
// =====================================================================

struct ResolvedArg {
  string name;
  string param;
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
  long long correctionIndex = 0;
  bool hasExpected = false;
  long long expected = 0;
};

struct FunctionSpec {
  string fnName;
  vector<ResolvedArg> args;
  ResolvedOutput out;
  // See ineffective_multi_query.cpp: function_inputs/*.json carries no "q",
  // so default to KYBER_Q, overridden by an explicit "q" in the spec.
  long long fieldSize = 3329;
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
                                       const ArgMap &M) {
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

  long long clampLength = 0;
  getInt("length", clampLength);
  getInt("q", spec.fieldSize);
  if (spec.fieldSize < 2)
    throw runtime_error("Field size q must be >= 2");

  long long correctionIndex = 0;
  getInt("index", correctionIndex);

  // See ineffective_multi_query.cpp: "distribution" documents which value
  // domain "q" below was chosen to cover for this function's varied input
  // (full ring element, small noise, packed byte, ...). Not used in solving.
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
  spec.out.correctionIndex = correctionIndex;
  bool outIsAnchor = outRegion.empty() || outRegion == anchorRegion;
  if (outIsAnchor) {
    spec.out.scalar = true;
    spec.out.anchorName = anchorRegion;
    spec.out.length = 1;
    spec.out.correctionIndex = 0;
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
  }
  if (spec.out.correctionIndex < 0 ||
      spec.out.correctionIndex >= spec.out.length)
    throw runtime_error("\"index\" out of range for output '" + outputName +
                        "'");

  static const vector<string> reserved = {"output", "varied",       "length",
                                          "index",  "q",            "distribution",
                                          "params"};
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
      if (!kv.second.isString && fromTrace != kv.second.i)
        throw runtime_error("Scalar '" + key + "' is " +
                            to_string(kv.second.i) + " in " + jsonPath +
                            " but " + to_string(fromTrace) +
                            " in the trace -- stale function_inputs file?");
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
      a.start = r.start;
      a.length = lengthFor(region);
      if (kv.second.kind == JsonValue::KIND_INT_ARRAY) {
        // See ineffective_multi_query.cpp: the real function_inputs/*.json
        // files give a full sampled per-coefficient array.
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

  if (spec.args.empty())
    throw runtime_error("No input regions found in " + jsonPath);

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
// Per-alpha-candidate correction check, run in its own thread with its
// own z3::context. alphaCandidate is a GROUND value supplied by the
// thread's own index -- NOT an existential Z3 variable. Combined with
// pinning every input to spec's fill values, this makes each thread's
// check a fully-determined equality test with exactly one correct
// answer.
// =====================================================================

struct InputVals {
  string name;
  vector<long long> vals;
};

struct CorrectionResult {
  int value = -1; // the alpha candidate this thread tried
  bool attempted = false; // false if skipped because SAT was already found
                          // elsewhere -- distinct from a genuine Z3 unknown
  check_result res = unknown;
  long long alpha = -1;
  long long corrIndex = -1;
  vector<InputVals> inputs;
  vector<long long> out_correct, out_faulty;
};

static CorrectionResult check_value_correction(
    int alphaCandidate, const FunctionSpec &spec, const string &c,
    const string &f, const string &correct_src, const string &faulty_src,
    const MemoryLayout &layoutC, const MemoryLayout &layoutF,
    const vector<string> &inputMemC, const vector<string> &inputMemF,
    const vector<string> &anonC, const vector<string> &anonF,
    mutex &ctxMutex, vector<context *> &activeCtx, unsigned workerSlot,
    const atomic<bool> &stopRequested) {
  const ResolvedOutput &out = spec.out;
  CorrectionResult res;
  res.value = alphaCandidate;

  if (stopRequested.load(memory_order_acquire))
    return res; // another worker already found SAT; don't bother starting
  res.attempted = true;

  context ctx; // thread-local -- never shared

  // Register this thread's context so the worker that finds SAT can
  // interrupt every other in-flight solve instead of waiting for the
  // (up to 20s) per-candidate timeout to expire on its own.
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
  p.set("timeout", 20000u); // per candidate, in its own thread
  slv.set(p);

  expr_vector C = ctx.parse_file(c.c_str());
  expr_vector F = ctx.parse_file(f.c_str());
  for (expr e : C)
    slv.add(e);
  for (expr e : F)
    slv.add(e);

  for (auto &base : anonC) {
    expr v = ctx.int_const((base + "_C").c_str());
    slv.add(v >= ctx.int_val(0) && v <= ctx.int_val(1));
  }
  for (auto &base : anonF) {
    expr v = ctx.int_const((base + "_F").c_str());
    slv.add(v >= ctx.int_val(0) && v <= ctx.int_val(1));
  }

  z3::sort arr_sort = ctx.array_sort(ctx.int_sort(), ctx.int_sort());
  auto mem = [&](const string &sym, const string &tag) {
    return ctx.constant((sym + "_" + tag).c_str(), arr_sort);
  };

  if (inputMemC.empty() || inputMemF.empty())
    throw runtime_error("No input memory selected for correction query");
  if (inputMemC.size() != inputMemF.size())
    throw runtime_error("Correct/faulty traces expose different numbers of "
                        "input memory interfaces");

  vector<expr> seedC, seedF;
  for (size_t k = 0; k < inputMemC.size(); ++k) {
    seedC.push_back(mem(inputMemC[k], "C"));
    seedF.push_back(mem(inputMemF[k], "F"));
  }

  for (size_t k = 0; k < seedC.size(); ++k) {
    for (auto &a : spec.args) {
      for (long long i = 0; i < a.length; ++i) {
        expr addr = ctx.int_val((int)(a.start + i));

        expr cvi = ctx.int_const(
            (a.name + "_C_" + to_string(k) + "_" + to_string(i)).c_str());
        expr fvi = ctx.int_const(
            (a.name + "_F_" + to_string(k) + "_" + to_string(i)).c_str());

        slv.add(select(seedC[k], addr) == cvi);
        slv.add(select(seedF[k], addr) == fvi);

        long long fillVal = a.fillValues.empty() ? a.fillValue : a.fillValues[i];
        slv.add(cvi == ctx.int_val((int)fillVal));
        slv.add(fvi == ctx.int_val((int)fillVal));
      }
    }
  }

  unsigned bits = bits_for_field(spec.fieldSize);
  expr alpha = ctx.int_val(alphaCandidate);
  expr alphaBV = int2bv(bits, alpha);

  expr finC = mem(layoutC.finalMem, "C");
  expr finF = mem(layoutF.finalMem, "F");

  expr cv0 = ctx.int_val(0), fv0 = ctx.int_val(0);
  if (out.scalar) {
    string anchC = resolve_final_ssa_symbol(correct_src, out.anchorName, false);
    string anchF = resolve_final_ssa_symbol(faulty_src, out.anchorName, true);
    cv0 = ctx.int_const((anchC + "_C").c_str());
    fv0 = ctx.int_const((anchF + "_F").c_str());
  } else {
    expr addr = ctx.int_val((int)(out.start + out.correctionIndex));
    cv0 = select(finC, addr);
    fv0 = select(finF, addr);
  }

  expr corrected = bv2int(int2bv(bits, fv0) ^ alphaBV, false);
  slv.add(cv0 == corrected);

  res.res = slv.check();
  if (res.res != sat)
    return res;

  model m = slv.get_model();
  res.alpha = alphaCandidate;
  res.corrIndex = out.scalar ? -1 : out.correctionIndex;

  for (auto &a : spec.args) {
    InputVals iv{a.name, {}};
    for (long long i = 0; i < a.length; i++)
      iv.vals.push_back(eval_i64(
          m, ctx.int_const((a.name + "_C_0_" + to_string(i)).c_str())));
    res.inputs.push_back(iv);
  }

  if (out.scalar) {
    res.out_correct.push_back(eval_i64(m, cv0));
    res.out_faulty.push_back(eval_i64(m, fv0));
  } else {
    for (long long i = 0; i < out.length; i++) {
      expr addr = ctx.int_val((int)(out.start + i));
      res.out_correct.push_back(eval_i64(m, select(finC, addr)));
      res.out_faulty.push_back(eval_i64(m, select(finF, addr)));
    }
  }

  return res;
}

static bool ends_with(const string &s, const string &suf) {
  return s.size() >= suf.size() &&
         s.compare(s.size() - suf.size(), suf.size(), suf) == 0;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    cerr << "Usage: ./correction_query <fnName> [function_inputs.json]\n";
    return 1;
  }
  string fn = argv[1];
  string fn_path = "../../tests_kyber/" + fn + "/";
  string correct_path = fn_path + fn + ".smt2";
  // Fault traces are split across three categories emitted by the
  // injection pipeline; collect .smt2 files from every one that exists
  // rather than hardcoding a single directory.
  static const vector<string> faultDirNames = {"loopOrFuncSkip", "binOpFault",
                                               "loadStoreSkip"};
  string active_path = fn_path + "active_lengths.json";
  string spec_path = argc > 2 ? argv[2]
                              : ("../../../function_inputs/" +
                                 kyber_base_name(fn) + ".json");
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

  string correct_raw = read_file(correct_path);
  MemoryLayout layoutC = parse_layout(correct_raw);
  print_layout(layoutC, "correct");

  string outputRegionExclude;
  string outputName;
  vector<string> paramOrder;
  {
    JsonObj peek = parse_flat_json_first_record(spec_path);
    const JsonValue *v = json_find(peek, "output");
    if (v && v->isString) {
      outputName = v->s;
      if (layoutC.regions.count(v->s))
        outputRegionExclude = v->s;
      else
        outputRegionExclude = find_region_by_prefix(v->s, layoutC);
      if (!outputRegionExclude.empty())
        cout << "[note] excluding output region '" << outputRegionExclude
             << "' from positional input matching (JSON said '" << v->s
             << "')\n";
    }
    // function_inputs has no explicit parameter-declaration order, but
    // every Kyber ref function puts the output pointer first, and
    // active_lengths.json (a separate tool's output) lists the remaining
    // pointer params in declaration order.
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

  ArgMap argMap = build_arg_map(fn, active_path, layoutC, correct_raw,
                                outputRegionExclude, paramOrder);
  FunctionSpec spec =
      load_function_spec(fn, spec_path, layoutC, correct_raw, argMap);
  const ResolvedOutput &out = spec.out;

  for (auto &a : spec.args) {
    string desc = a.fillValues.empty()
                     ? ("= " + to_string(a.fillValue))
                     : ("= <array of " + to_string(a.fillValues.size()) +
                        " sampled value(s), e.g. " +
                        to_string(a.fillValues[0]) + ">");
    cout << "[arg] " << a.param << " (" << a.name << ") " << desc << " ["
         << a.start << ".." << a.start + a.length - 1 << "]\n";
  }
  if (out.scalar)
    cout << "[out] scalar via anchor " << out.anchorName << "\n";
  else
    cout << "[out] " << out.label << " [" << out.start << ".."
         << out.start + out.length - 1 << "], correcting byte "
         << out.start + out.correctionIndex << "\n";

  string correct_src = strip_bad_asserts(strip_last_assert(correct_raw));

  vector<string> inputMemC;
  if (out.scalar) {
    string anchC = resolve_final_ssa_symbol(correct_src, out.anchorName, false);
    inputMemC = find_anchor_read_memories(correct_src, anchC);
    cout << "[mem] scalar anchor (correct): " << anchC << "\n";
    cout << "[mem] scalar input memories (correct):";
    for (const auto &m : inputMemC)
      cout << " " << m;
    cout << "\n";
  } else {
    inputMemC.push_back(layoutC.finalMem);
    cout << "[mem] array output: seeding correct inputs on Final_Memory "
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

  string c = write_suffixed(correct_src, "C", fn_path);

  bool anySat = false;

  // ---- one full brute-force pass per faulty candidate in loopOrFuncSkip/,
  //      each of which spawns one thread per alpha candidate ----
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

    if (traces_structurally_identical(correct_src, faulty_src)) {
      cout << "[!] WARNING: once _correct/_faulty labels are normalized "
              "away, this faulty trace is IDENTICAL to the correct trace "
              "(same formula, same internal SSA numbering). The fault "
              "does not appear to be encoded in this SMT file at all -- "
              "any SAT/UNSAT result below is a property of that identity, "
              "not of the actual fault. Check the trace-generation "
              "pipeline for this fault site, not this query.\n";
    }

    vector<string> inputMemF;
    if (out.scalar) {
      string anchF = resolve_final_ssa_symbol(faulty_src, out.anchorName, true);
      inputMemF = find_anchor_read_memories(faulty_src, anchF);
      cout << "[mem] scalar anchor (faulty): " << anchF << "\n";
      cout << "[mem] scalar input memories (faulty):";
      for (const auto &m : inputMemF)
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

    string f = write_suffixed(faulty_src, "F", fn_path);

    int numCandidates = (int)spec.fieldSize;

    // "q" can be the full KYBER_Q ring (3329) -- far too large to spawn one
    // OS thread per candidate as MAYO's GF(16) design did. Instead run a
    // bounded pool of nproc() workers pulling candidates from a shared
    // work queue; as soon as any candidate comes back SAT, every other
    // in-flight solve is interrupted (via z3::context::interrupt) and no
    // new candidates are started -- we only need ONE correcting alpha, not
    // an exhaustive brute force.
    unsigned numWorkers = std::thread::hardware_concurrency();
    if (numWorkers == 0)
      numWorkers = 1;
    numWorkers = (unsigned)min<long long>(numWorkers, numCandidates);

    cout << "Brute-forcing alpha in F_" << spec.fieldSize
         << " with a pool of " << numWorkers
         << " worker thread(s) (nproc), against the single fixed scenario "
            "in "
         << spec_path
         << "; stopping and interrupting every other in-flight solve as "
            "soon as one candidate comes back SAT.\n";

    vector<CorrectionResult> results(numCandidates);
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
          if (v >= numCandidates)
            break;
          CorrectionResult r = check_value_correction(
              (int)v, spec, c, f, correct_src, faulty_src, layoutC, layoutF,
              inputMemC, inputMemF, anonC, anonF, ctxMutex, activeCtx, w,
              foundSat);
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
      cout << "\n================ alpha = " << r.value
           << " (SAT) ================\n";
      cout << "  correction index = " << r.corrIndex << "  alpha = " << r.alpha
           << "\n";
      if (out.hasExpected) {
        long long got = r.out_correct[out.scalar ? 0 : out.correctionIndex];
        if (got != out.expected)
          cout << "  [!] expected " << out.label << "[" << out.correctionIndex
               << "] = " << out.expected << " per function_inputs, got " << got
               << " from the correct trace\n";
      }
      if (!out.scalar) {
        bool mismatchElsewhere = false;
        for (long long i = 0; i < out.length; i++) {
          if (i == r.corrIndex)
            continue;
          if (r.out_correct[i] != r.out_faulty[i]) {
            mismatchElsewhere = true;
            cout << "  [!] unexpected mismatch at index " << i
                 << ": correct=" << r.out_correct[i]
                 << " faulty=" << r.out_faulty[i] << "\n";
          }
        }
        if (!mismatchElsewhere)
          cout << "  (all other " << out.length - 1
               << " bytes matched correct/faulty with no correction, as "
                  "expected)\n";
      }
    }

    cout << "\n================ BRUTE-FORCE SUMMARY (" << tag
         << ") ================\n";
    cout << "Attempted " << attemptedCount << " of " << numCandidates
         << " candidate(s) before stopping.\n";
    cout << "SAT (correct alpha found) for candidates:";
    for (int v : satValues)
      cout << " " << v;
    cout << "\n";
    cout << "UNSAT for candidates:";
    for (int v : unsatValues)
      cout << " " << v;
    cout << "\n";
    if (!unknownValues.empty()) {
      cout << "UNKNOWN/TIMEOUT for candidates:";
      for (int v : unknownValues)
        cout << " " << v;
      cout << "\n[!] some attempted candidates could not be decided within "
              "the timeout.\n";
    }
    if (!satValues.empty() && attemptedCount > 1 &&
        (long long)satValues.size() == attemptedCount)
      cout << "[!] every candidate attempted before stopping was SAT -- the "
              "compared values are probably not determined by the pinned "
              "inputs; check the seed point, or whether this faulty trace "
              "actually differs from the correct one.\n";

    if (satValues.empty()) {
      if (attemptedCount == numCandidates)
        cout << "[!] No SAT alpha found for " << tag
             << " after exhausting all " << numCandidates
             << " candidate(s).\n";
      else
        cout << "[!] No SAT alpha found for " << tag
             << " (search did not finish -- see UNKNOWN/TIMEOUT above).\n";
      continue;
    }
    cout << "[+] stopped early after finding SAT at alpha "
         << satFoundValue.load() << " -- "
         << (numCandidates - attemptedCount) << " candidate(s) left "
         << "unexplored.\n";
    anySat = true;

    string witness_path = fn_path + "correction_smt_witness_" + tag + ".json";
    ofstream wj(witness_path);
    wj << "{\n";
    wj << "  \"function\": \"" << fn << "\",\n";
    wj << "  \"fault\": \"" << tag << "\",\n";
    wj << "  \"field_size\": " << spec.fieldSize << ",\n";
    wj << "  \"sat_alpha_candidates\": "
       << json_arr(vector<long long>(satValues.begin(), satValues.end()))
       << "\n";
    // wj << "  \"trials\": [\n";
    // bool firstTrial = true;
    // for (auto &r : results) {
    //   if (r.res != sat)
    //     continue;

    //   wj << (firstTrial ? "    {\n" : ",\n    {\n");
    //   wj << "      \"alpha_candidate\": " << r.value << ",\n";
    //   wj << "      \"correction\": {\n";
    //   if (r.corrIndex >= 0)
    //     wj << "        \"index\": " << r.corrIndex << ",\n";
    //   wj << "        \"alpha\": " << r.alpha << "\n";
    //   wj << "      },\n";
    //   wj << "      \"inputs\": {\n";
    //   bool ifirst = true;
    //   for (auto &iv : r.inputs) {
    //     wj << (ifirst ? "        " : ",\n        ") << "\"" << iv.name
    //        << "\": " << json_arr(iv.vals);
    //     ifirst = false;
    //   }
    //   wj << "\n      },\n";
    //   wj << "      \"outputs\": {\n";
    //   wj << "        \"" << out.label
    //      << "_correct\": " << json_arr(r.out_correct) << ",\n";
    //   wj << "        \"" << out.label
    //      << "_faulty\": " << json_arr(r.out_faulty) << "\n";
    //   wj << "      }\n";
    //   wj << "    }";
    //   firstTrial = false;
    // }
    // wj << "\n  ]\n";
    wj << "}\n";
    cout << "[+] correction witness exported to " << witness_path << "\n";
  }

  return anySat ? 0 : 1;
}