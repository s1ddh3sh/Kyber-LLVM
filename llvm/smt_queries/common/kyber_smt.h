// kyber_smt.h -- shared plumbing for the Kyber ineffective/correction SMT
// queries (ineffective_multi_query.cpp / correction_multi_query.cpp).
//
// Adapted from MAYO-LLVM-Examples/smt_queries/common/mayo_smt.h. The
// per-function parameters come from the SAME files the Unicorn simulation
// reads (test_qemu/dist_tests/kyber/run_combined_unicorn.sh):
//
//   kyber.json                          secret-buf / eph_secret / fixed-scalars
//   tests_kyber/<fn>/qemu_witness.json    argument layout (role, length,
//                                         distribution, scalar anchors)
//   tests_kyber/<fn>/active_lengths.json  bytes of each input actually filled
//
// Instead of sampling a handful of public backgrounds p (one per seed), the
// queries quantify over p symbolically. Every active input is drawn from the
// same domain the simulation's sample_for_distribution() draws from
// (distributions_unicorn.py): an R_q-shaped buffer is one int16 SMT variable
// per coefficient, constrained to its distribution's range ([0, q),
// [-eta, eta], {0, round(q/2)}, ...); a byte-string buffer is one 8-bit
// variable per byte. Only the swept secret coefficient
// secret_buf[secret_pos] is fixed per query; the swept values are
// domain_values(secret distribution, --field-mod) exactly as in
// early_stop_sweep_unicorn.py.
//
// Outputs are compared per word like the simulation: int16 coefficients
// for an R_q-shaped output (diff-mode mod-sub, modulus q), the scalar's own
// width for a scalar output, raw bytes otherwise (diff-mode xor).
//
// To make the inputs symbolic, the driver prelude that llvmbmc encodes
// (kyber_memset -> zero-filling lambda, then `store i8 <const>` for the
// baked-in function_inputs value) is rewritten: the lambda of every input
// region yields a fresh array `__in_<region>_<correct|faulty>` over the
// region's active bytes, and the constant stores into the active part of
// input regions are dropped. Bytes beyond the active length keep the
// driver's values, as in the simulation (which only overwrites the active
// prefix). Output-only regions keep their zero fill.
#pragma once

#include "z3++.h"

#include <algorithm>
#include <atomic>
#include <chrono>
#include <cctype>
#include <cstring>
#include <cstdint>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <map>
#include <mutex>
#include <regex>
#include <set>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <tuple>
#include <unordered_set>
#include <utility>
#include <vector>

namespace kyber_smt {

using std::map;
using std::pair;
using std::runtime_error;
using std::set;
using std::string;
using std::to_string;
using std::vector;
namespace fs = std::filesystem;

// =====================================================================
// Small utilities
// =====================================================================

inline string read_file(const string &path) {
  std::ifstream ifs(path);
  if (!ifs)
    throw runtime_error("Cannot open: " + path);
  return string((std::istreambuf_iterator<char>(ifs)),
                std::istreambuf_iterator<char>());
}

inline vector<string> split_csv(const string &s) {
  vector<string> out;
  string cur;
  std::istringstream iss(s);
  while (std::getline(iss, cur, ','))
    if (!cur.empty())
      out.push_back(cur);
  return out;
}

inline bool starts_with(const string &s, const string &p) {
  return s.rfind(p, 0) == 0;
}
inline bool ends_with(const string &s, const string &suf) {
  return s.size() >= suf.size() &&
         s.compare(s.size() - suf.size(), suf.size(), suf) == 0;
}

template <class T>
inline string join_vals(const vector<T> &v, size_t limit = SIZE_MAX) {
  std::ostringstream o;
  o << "[";
  for (size_t i = 0; i < v.size() && i < limit; i++)
    o << (i ? ", " : "") << v[i];
  if (v.size() > limit)
    o << ", ... +" << v.size() - limit;
  o << "]";
  return o.str();
}

// Balanced-paren match starting at s[open] == '('.
inline size_t match_paren(const string &s, size_t open) {
  int depth = 0;
  for (size_t i = open; i < s.size(); i++) {
    if (s[i] == '(')
      depth++;
    else if (s[i] == ')') {
      if (--depth == 0)
        return i;
    }
  }
  return string::npos;
}

// Runs f(0..n-1) on `jobs` threads. The first exception is rethrown.
template <class F> void parallel_for(size_t n, unsigned jobs, F f) {
  std::atomic<size_t> next{0};
  std::mutex errMu;
  string err;
  unsigned nt = (unsigned)std::max<size_t>(1, std::min<size_t>(jobs, n));
  vector<std::thread> ts;
  for (unsigned j = 0; j < nt; j++)
    ts.emplace_back([&] {
      for (size_t k; (k = next++) < n;) {
        try {
          f(k);
        } catch (const z3::exception &e) {
          std::lock_guard<std::mutex> g(errMu);
          if (err.empty())
            err = string("z3: ") + e.msg();
        } catch (const std::exception &e) {
          std::lock_guard<std::mutex> g(errMu);
          if (err.empty())
            err = e.what();
        }
      }
    });
  for (auto &t : ts)
    t.join();
  if (!err.empty())
    throw runtime_error(err);
}

// Caps `want` parallel solver instances so that their estimated footprint
// stays within 60% of MemAvailable. A Z3 context holding trace copies takes
// ~40x the SMT text size; 60x is used for headroom.
inline unsigned mem_safe_jobs(unsigned want, size_t textBytesPerInstance,
                              const char *what) {
  std::ifstream mi("/proc/meminfo");
  string key;
  size_t kb = 0, availKb = 0;
  string unit;
  while (mi >> key >> kb >> unit)
    if (key == "MemAvailable:") {
      availKb = kb;
      break;
    }
  if (availKb == 0 || want <= 1)
    return std::max(1u, want);
  double est = 60.0 * (double)textBytesPerInstance;
  unsigned fit = (unsigned)std::max(1.0, 0.6 * availKb * 1024.0 / est);
  if (fit < want) {
    std::cout << "[i] " << what << ": limiting to " << fit
              << " parallel job(s) (~" << (size_t)(est / (1 << 20))
              << " MB each, " << availKb / 1024 << " MB available)\n";
    return fit;
  }
  return want;
}

// =====================================================================
// Minimal JSON (objects keep insertion order -- the witness layout's
// order IS the function's parameter order).
// =====================================================================

struct Json {
  enum Type { Null, Bool, Num, Str, Arr, Obj } type = Null;
  bool b = false;
  string text; // number literal or string value
  vector<Json> arr;
  vector<pair<string, Json>> obj;

  const Json *get(const string &k) const {
    if (type != Obj)
      return nullptr;
    for (auto &kv : obj)
      if (kv.first == k)
        return &kv.second;
    return nullptr;
  }
  string str(const string &k, const string &dflt = "") const {
    const Json *v = get(k);
    return (v && v->type == Str) ? v->text : dflt;
  }
  long long integer(const string &k, long long dflt) const {
    const Json *v = get(k);
    if (!v || v->type != Num)
      return dflt;
    try {
      return std::stoll(v->text);
    } catch (...) {
      return dflt;
    }
  }
  bool boolean(const string &k) const {
    const Json *v = get(k);
    return v && v->type == Bool && v->b;
  }
};

class JsonParser {
public:
  explicit JsonParser(const string &s) : s_(s) {}
  Json parse() {
    Json v = value();
    ws();
    if (i_ != s_.size())
      fail("trailing characters");
    return v;
  }

private:
  const string &s_;
  size_t i_ = 0;

  [[noreturn]] void fail(const string &m) {
    throw runtime_error("JSON parse error at offset " + to_string(i_) + ": " +
                        m);
  }
  void ws() {
    while (i_ < s_.size() && isspace((unsigned char)s_[i_]))
      i_++;
  }
  string strlit() {
    if (s_[i_] != '"')
      fail("expected string");
    string out;
    for (i_++; i_ < s_.size() && s_[i_] != '"'; i_++) {
      if (s_[i_] == '\\' && i_ + 1 < s_.size())
        i_++;
      out += s_[i_];
    }
    if (i_ >= s_.size())
      fail("unterminated string");
    i_++;
    return out;
  }
  Json value() {
    ws();
    if (i_ >= s_.size())
      fail("unexpected end");
    Json v;
    char c = s_[i_];
    if (c == '{') {
      v.type = Json::Obj;
      i_++;
      ws();
      if (s_[i_] == '}') {
        i_++;
        return v;
      }
      while (true) {
        ws();
        string k = strlit();
        ws();
        if (s_[i_++] != ':')
          fail("expected ':'");
        v.obj.push_back({k, value()});
        ws();
        if (s_[i_] == ',') {
          i_++;
          continue;
        }
        if (s_[i_] == '}') {
          i_++;
          return v;
        }
        fail("expected ',' or '}'");
      }
    }
    if (c == '[') {
      v.type = Json::Arr;
      i_++;
      ws();
      if (s_[i_] == ']') {
        i_++;
        return v;
      }
      while (true) {
        v.arr.push_back(value());
        ws();
        if (s_[i_] == ',') {
          i_++;
          continue;
        }
        if (s_[i_] == ']') {
          i_++;
          return v;
        }
        fail("expected ',' or ']'");
      }
    }
    if (c == '"') {
      v.type = Json::Str;
      v.text = strlit();
      return v;
    }
    if (s_.compare(i_, 4, "true") == 0) {
      v.type = Json::Bool;
      v.b = true;
      i_ += 4;
      return v;
    }
    if (s_.compare(i_, 5, "false") == 0) {
      v.type = Json::Bool;
      i_ += 5;
      return v;
    }
    if (s_.compare(i_, 4, "null") == 0) {
      i_ += 4;
      return v;
    }
    size_t st = i_;
    while (i_ < s_.size() && (isdigit((unsigned char)s_[i_]) ||
                              strchr("+-.eE", s_[i_])))
      i_++;
    if (st == i_)
      fail("unexpected character");
    v.type = Json::Num;
    v.text = s_.substr(st, i_ - st);
    return v;
  }
};

inline Json load_json(const string &path) {
  return JsonParser(read_file(path)).parse();
}

// =====================================================================
// Kyber distributions -- port of the _DISTRIBUTION_TABLE / infer_field_mod
// / domain_values block of test_qemu/dist_tests/kyber/setup/
// distributions_unicorn.py. Keep the two in sync.
// =====================================================================

constexpr long KYBER_Q = 3329;

struct Dist {
  enum Kind { Unknown, Bytes, Cbd, PolyModQ, PolySigned, MessagePoly };
  Kind kind = Unknown;
  long extra = 0; // eta for Cbd, bound for PolySigned
  string name;

  // R_q-shaped: int16_t coefficients (2 bytes each).
  bool wordShaped() const {
    return kind == Cbd || kind == PolyModQ || kind == PolySigned ||
           kind == MessagePoly;
  }
};

inline Dist lookup_dist(const string &name, int kyberK) {
  long eta1 = kyberK == 2 ? 3 : 2;
  long eta2 = 2;
  static const set<string> bytes = {
      "Kyber ciphertext byte string", "Kyber public key byte string",
      "Kyber secret key byte string", "message byte string",
      "shared secret byte string",    "uniform 256-bit byte string"};
  static const set<string> modq = {
      "R_q = Z_q[X]/(X^n + 1), coefficient domain",
      "R_q = Z_q[X]/(X^n + 1), coefficient domain polyvec",
      "R_q = Z_q[X]/(X^n + 1), NTT domain",
      "R_q = Z_q[X]/(X^n + 1), NTT domain polyvec",
      "R_q = Z_q[X]/(X^n + 1), poly",
      "R_q = Z_q[X]/(X^n + 1), polyvec",
      "uniform polynomial matrix in R_q"};
  static const set<string> reduced = {
      "R_q = Z_q[X]/(X^n + 1), reduced coefficients",
      "R_q = Z_q[X]/(X^n + 1), reduced polynomial",
      "R_q = Z_q[X]/(X^n + 1), reduced polyvec"};
  Dist d;
  d.name = name;
  if (name.empty())
    return d;
  if (bytes.count(name))
    d.kind = Dist::Bytes;
  else if (name == "centered binomial distribution, eta1")
    d = {Dist::Cbd, eta1, name};
  else if (name == "centered binomial distribution, eta2")
    d = {Dist::Cbd, eta2, name};
  else if (name == "message embedded in R_q = Z_q[X]/(X^n + 1)")
    d.kind = Dist::MessagePoly;
  else if (modq.count(name))
    d.kind = Dist::PolyModQ;
  else if (name == "R_q = Z_q[X]/(X^n + 1), Montgomery domain")
    d = {Dist::PolySigned, KYBER_Q - 1, name};
  else if (reduced.count(name))
    d = {Dist::PolySigned, KYBER_Q / 2, name};
  return d;
}

// infer_field_mod(): values one coefficient can take; 256 for byte strings
// and unknown distributions.
inline long infer_field_mod(const Dist &d) {
  switch (d.kind) {
  case Dist::Cbd:
  case Dist::PolySigned:
    return 2 * d.extra + 1;
  case Dist::PolyModQ:
    return KYBER_Q;
  case Dist::MessagePoly:
    return 2;
  default:
    return 256;
  }
}

// domain_values(): at most `count` secret values inside the distribution's
// range -- 0 first, the rest evenly spaced over the whole range.
inline vector<long> domain_values(const Dist &d, long count,
                                  unsigned wordSize) {
  long lo = 0, hi = 255;
  if (wordSize != 1 && d.wordShaped()) {
    if (d.kind == Dist::MessagePoly) {
      vector<long> v = {0, (KYBER_Q + 1) / 2};
      v.resize(std::min<size_t>(v.size(), (size_t)std::max(0L, count)));
      return v;
    }
    if (d.kind == Dist::Cbd || d.kind == Dist::PolySigned) {
      lo = -d.extra;
      hi = d.extra;
    } else if (d.kind == Dist::PolyModQ) {
      lo = 0;
      hi = KYBER_Q - 1;
    }
  }
  long size = hi - lo + 1;
  bool zeroIn = lo <= 0 && 0 <= hi;
  vector<long> out;
  if (count >= size) {
    if (zeroIn)
      out.push_back(0);
    for (long v = lo; v <= hi; v++)
      if (!(zeroIn && v == 0))
        out.push_back(v);
    return out;
  }
  set<long> seen;
  auto add = [&](long v) {
    if (!seen.count(v) && (long)out.size() < count) {
      seen.insert(v);
      out.push_back(v);
    }
  };
  if (zeroIn)
    add(0);
  long n = std::max(count, 2L);
  for (long i = 0; i < n; i++)
    add(lo + (i * (size - 1)) / (n - 1));
  for (long v = lo; (long)out.size() < count; v++)
    add(v);
  return out;
}

// =====================================================================
// Trace layout (the `;; Array <name> <start> <end>` comments)
// =====================================================================

struct Region {
  string name;
  uint64_t start = 0, end = 0; // inclusive
  uint64_t size() const { return end - start + 1; }
};

struct TraceLayout {
  vector<Region> regions; // file order
  string initialMem, finalMem;

  const Region *find(const string &n) const {
    for (auto &r : regions)
      if (r.name == n)
        return &r;
    return nullptr;
  }
};

inline TraceLayout parse_trace_layout(const string &src) {
  TraceLayout L;
  static const std::regex arr(
      R"(;;\s*Array\s+([A-Za-z_][A-Za-z0-9_.]*)\s+(\d+)\s+(\d+))");
  for (auto it = std::sregex_iterator(src.begin(), src.end(), arr);
       it != std::sregex_iterator(); ++it) {
    Region r{(*it)[1].str(), std::stoull((*it)[2].str()),
             std::stoull((*it)[3].str())};
    if (r.end < r.start)
      throw runtime_error("Malformed region '" + r.name + "'");
    if (!L.find(r.name))
      L.regions.push_back(r);
  }
  if (L.regions.empty())
    throw runtime_error("No ';; Array <name> <start> <end>' comments in trace");
  std::smatch m;
  static const std::regex ini(R"(;;\s*Initial_Memory\s+(\S+))");
  static const std::regex fin(R"(;;\s*Final_Memory\s+(\S+))");
  if (std::regex_search(src, m, ini))
    L.initialMem = m[1].str();
  if (!std::regex_search(src, m, fin))
    throw runtime_error("No ';; Final_Memory <symbol>' comment in trace -- "
                        "regenerate it with ./run_faults.sh (llvmbmc "
                        "--memory-granularity 8 --smt-only)");
  L.finalMem = m[1].str();
  return L;
}

inline void check_layouts_match(const TraceLayout &a, const TraceLayout &b) {
  if (a.regions.size() != b.regions.size())
    throw runtime_error("correct/faulty traces declare different regions");
  for (auto &r : a.regions) {
    const Region *o = b.find(r.name);
    if (!o || o->start != r.start || o->end != r.end)
      throw runtime_error("Region '" + r.name +
                          "' differs between correct and faulty trace");
  }
}

// =====================================================================
// Function configuration: kyber.json + qemu_witness.json + active_lengths
// =====================================================================

// One independently sampled unit of an input: an int16 coefficient
// (bytes == 2) or a single byte.
struct Slot {
  uint64_t off;
  unsigned bytes;
};

struct InputBuf {
  string param, region;
  uint64_t start = 0, regionLen = 0, active = 0;
  bool secret = false, eph = false;
  // A scalar argument the simulation randomizes: the driver passes it from
  // __VERIFIER_nondet_iN (a bv_<N>_nondet symbol in the trace), not memory.
  bool scalar = false;
  unsigned bits = 0;
  Dist dist;
  // Name stem of this input's public SMT variables.
  string key() const { return scalar ? "arg_" + param : region; }

  // sample_for_distribution(): an R_q-shaped buffer is active/2 int16
  // coefficients (plus a raw trailing byte if active is odd); anything else
  // is active bytes.
  vector<Slot> slots() const {
    vector<Slot> s;
    if (dist.wordShaped()) {
      for (uint64_t k = 0; k + 1 < active; k += 2)
        s.push_back({k, 2});
      if (active % 2)
        s.push_back({active - 1, 1});
    } else {
      for (uint64_t i = 0; i < active; i++)
        s.push_back({i, 1});
    }
    return s;
  }
};

struct OutputBuf {
  string param, region;
  uint64_t start = 0, length = 0; // bytes
  unsigned wordSize = 1;          // 1, 2 or 4
  bool modSub = false;            // diff-mode mod-sub (else xor)
  uint64_t words() const { return length / wordSize; }
};

struct FuncConfig {
  string fn;
  string secretParam;
  uint64_t secretPos = 0;      // coefficient index (word size 2) or byte
  unsigned secretWordSize = 1; // 2 for an R_q-shaped secret
  vector<long> secretValues;   // swept values, domain_values() order
  long bgFieldMod = 256;       // fill domain of unknown-distribution bytes
  long modulus = KYBER_Q;      // for diff-mode mod-sub
  int kyberK = 3;
  vector<InputBuf> inputs;
  vector<OutputBuf> outputs;
  vector<string> ephParams;
  vector<string> notes;

  const InputBuf &secret() const {
    for (auto &i : inputs)
      if (i.secret)
        return i;
    throw runtime_error("no secret input");
  }
  bool hasEph() const {
    for (auto &i : inputs)
      if (i.eph)
        return true;
    return false;
  }
  uint64_t secretByteOff() const { return secretPos * secretWordSize; }
  // The secret coefficient's encoding for one swept value.
  uint64_t secretBits(long v) const {
    return secretWordSize == 2 ? (uint64_t)(v & 0xFFFF) : (uint64_t)(v & 0xFF);
  }
};

// The harness's buffers, in ascending address order == argument order.
inline vector<const Region *> buffer_regions(const TraceLayout &L) {
  vector<const Region *> out;
  for (auto &r : L.regions)
    if (!starts_with(r.name, "__mbc_") && !ends_with(r.name, "_blocker"))
      out.push_back(&r);
  std::sort(out.begin(), out.end(), [](const Region *a, const Region *b) {
    return a->start < b->start;
  });
  return out;
}

struct ConfigOverrides {
  string secretBuf;
  uint64_t secretPos = 0;
  long fieldMod = 256; // cap on the number of swept secret values
  string outBuf;       // "" = first role:output (as the simulation); "all"
  unsigned outWordSize = 0; // 0 = derive
  string diffMode;          // "" = derive
  long modulus = KYBER_Q;
  int kyberK = 0; // 0 = from the function name
};

inline int kyber_k_from_name(const string &fn) {
  if (fn.find("kyber512") != string::npos)
    return 2;
  if (fn.find("kyber1024") != string::npos)
    return 4;
  return 3;
}

inline FuncConfig resolve_config(const string &fn, const string &kyberJsonPath,
                                 const string &witnessPath,
                                 const string &activePath,
                                 const TraceLayout &L,
                                 const ConfigOverrides &ov) {
  FuncConfig cfg;
  cfg.fn = fn;
  cfg.secretPos = ov.secretPos;
  cfg.modulus = ov.modulus;
  cfg.kyberK = ov.kyberK ? ov.kyberK : kyber_k_from_name(fn);

  Json kyber = load_json(kyberJsonPath);
  const Json *entry = kyber.get(fn);
  if (!entry && ov.secretBuf.empty())
    throw runtime_error("'" + fn + "' not found in " + kyberJsonPath +
                        " and no --secret-buf given");
  Json empty;
  empty.type = Json::Obj;
  if (!entry)
    entry = &empty;

  cfg.secretParam =
      ov.secretBuf.empty() ? entry->str("secret-buf") : ov.secretBuf;
  if (cfg.secretParam.empty())
    throw runtime_error("no secret-buf for '" + fn + "'");
  vector<string> fixedV = split_csv(entry->str("fixed-scalars"));
  set<string> fixed(fixedV.begin(), fixedV.end());
  cfg.ephParams = split_csv(entry->str("eph_secret"));
  set<string> eph(cfg.ephParams.begin(), cfg.ephParams.end());

  Json witness = load_json(witnessPath);
  const Json *layout = witness.get("layout");
  if (!layout || layout->type != Json::Obj)
    throw runtime_error(witnessPath + " has no \"layout\" object");
  const Json *secSpec = layout->get(cfg.secretParam);
  if (!secSpec)
    throw runtime_error("secret-buf '" + cfg.secretParam +
                        "' is not in the witness layout of '" + fn + "'");
  Dist secDist = lookup_dist(secSpec->str("distribution"), cfg.kyberK);
  // run_combined_unicorn.sh: word size 2 iff the secret is R_q-shaped;
  // background bytes of unknown distribution are drawn mod the secret's
  // natural field size.
  cfg.secretWordSize = secDist.wordShaped() ? 2 : 1;
  cfg.bgFieldMod = infer_field_mod(secDist);
  cfg.secretValues = domain_values(secDist, ov.fieldMod, cfg.secretWordSize);
  if (cfg.secretValues.size() < 2)
    throw runtime_error("fewer than 2 secret values to sweep");

  Json active;
  active.type = Json::Obj;
  if (fs::exists(activePath))
    active = load_json(activePath);
  else
    cfg.notes.push_back("no " + activePath +
                        " -- using full witness lengths as active lengths");

  // Pointer parameters <-> trace buffer regions, positionally.
  vector<pair<string, const Json *>> ptrParams;
  for (auto &kv : layout->obj)
    if (kv.second.str("type") != "scalar")
      ptrParams.push_back({kv.first, &kv.second});
  vector<const Region *> bufs = buffer_regions(L);
  if (ptrParams.size() != bufs.size()) {
    string ps, rs;
    for (auto &p : ptrParams)
      ps += " " + p.first;
    for (auto *r : bufs)
      rs += " " + r->name;
    throw runtime_error("Cannot map witness pointer params (" + ps +
                        " ) onto trace buffer regions (" + rs +
                        " ): counts differ");
  }

  // Output word size / diff mode, as derive_all() in
  // run_combined_unicorn.sh: a scalar uses its own width (xor), an R_q-shaped
  // output is int16 words compared mod q, anything else raw bytes (xor).
  auto makeOutput = [&](const string &param, const Json &spec,
                        const Region &r, uint64_t len) {
    OutputBuf o{param, r.name, r.start, std::min<uint64_t>(len, r.size())};
    string od = spec.str("output_distribution");
    if (od.empty())
      od = spec.str("distribution");
    if (spec.str("type") == "scalar") {
      o.wordSize = (len == 1 || len == 2 || len == 4) ? (unsigned)len : 1;
    } else if (lookup_dist(od, cfg.kyberK).wordShaped()) {
      o.wordSize = 2;
      o.modSub = true;
    }
    if (ov.outWordSize)
      o.wordSize = ov.outWordSize;
    if (!ov.diffMode.empty())
      o.modSub = ov.diffMode == "mod-sub";
    return o;
  };

  for (size_t i = 0; i < ptrParams.size(); i++) {
    const string &param = ptrParams[i].first;
    const Json &spec = *ptrParams[i].second;
    const Region &r = *bufs[i];
    uint64_t wlen = (uint64_t)spec.integer("length", (long long)r.size());
    if (wlen != r.size())
      cfg.notes.push_back("'" + param + "' has length " + to_string(wlen) +
                          " in the witness but region '" + r.name + "' is " +
                          to_string(r.size()) + " bytes in the trace");
    string role = spec.str("role");
    bool asInput = role == "input" || spec.boolean("also_input");
    if (asInput) {
      InputBuf in;
      in.param = param;
      in.region = r.name;
      in.start = r.start;
      in.regionLen = r.size();
      in.active = (uint64_t)active.integer(param, (long long)wlen);
      if (in.active > r.size()) {
        cfg.notes.push_back("active length of '" + param + "' (" +
                            to_string(in.active) + ") clamped to region size " +
                            to_string(r.size()));
        in.active = r.size();
      }
      in.secret = param == cfg.secretParam;
      in.eph = eph.count(param) > 0;
      in.dist = lookup_dist(spec.str("distribution"), cfg.kyberK);
      cfg.inputs.push_back(in);
    }
    if (role == "output")
      cfg.outputs.push_back(makeOutput(param, spec, r, wlen));
  }

  // Scalars: outputs read from their anchor. Inputs in fixed-scalars are
  // folded to their init_value by llvmbmc (--fold-readonly-globals); the
  // others (secret included) are symbolic nondet values in traces generated
  // by the current generators (fault-types/bmc_variant.h). The simulation
  // fills a scalar over its whole width (no active length).
  for (auto &kv : layout->obj) {
    const Json &spec = kv.second;
    if (spec.str("type") != "scalar")
      continue;
    string anchor = spec.str("anchor");
    if (spec.str("role") == "output") {
      const Region *r = L.find(anchor);
      Region pseudo{anchor, 0, 0};
      uint64_t len = (uint64_t)spec.integer("length", 1);
      if (!r) {
        // Held in registers only: read from its final SSA symbol.
        pseudo.end = len - 1;
        r = &pseudo;
      }
      cfg.outputs.push_back(makeOutput(kv.first, spec, *r, len));
      if (r == &pseudo)
        cfg.outputs.back().start = 0;
      continue;
    }
    if (!fixed.count(kv.first) || kv.first == cfg.secretParam) {
      InputBuf in;
      in.param = kv.first;
      in.scalar = true;
      uint64_t len = (uint64_t)spec.integer("length", 4);
      in.bits = (unsigned)(8 * len);
      in.regionLen = len;
      in.active = len;
      in.secret = kv.first == cfg.secretParam;
      in.eph = eph.count(kv.first) > 0;
      in.dist = lookup_dist(spec.str("distribution"), cfg.kyberK);
      cfg.inputs.push_back(in);
      continue;
    }
    if (L.find(anchor))
      cfg.notes.push_back("scalar anchor region '" + anchor +
                          "' is present in the trace; its value is not "
                          "constrained by this query");
  }

  bool found = false;
  for (auto &in : cfg.inputs)
    if (in.secret)
      found = true;
  if (!found)
    throw runtime_error("secret-buf '" + cfg.secretParam +
                        "' is not an input of '" + fn + "'");
  for (auto &e : cfg.ephParams) {
    bool ok = false;
    for (auto &in : cfg.inputs)
      ok |= in.param == e;
    if (!ok)
      cfg.notes.push_back("eph_secret '" + e +
                          "' is not an input buffer -- ignored");
  }
  if (cfg.outputs.empty())
    throw runtime_error("no role:output entry in " + witnessPath);
  if (ov.outBuf.empty() && cfg.outputs.size() > 1) {
    cfg.notes.push_back("multiple outputs; analysing the first ('" +
                        cfg.outputs[0].param +
                        "') like the simulation -- --out-buf NAME|all to "
                        "change");
    cfg.outputs.resize(1);
  } else if (!ov.outBuf.empty() && ov.outBuf != "all") {
    vector<OutputBuf> keep;
    for (auto &o : cfg.outputs)
      if (o.param == ov.outBuf)
        keep.push_back(o);
    if (keep.empty())
      throw runtime_error("--out-buf '" + ov.outBuf + "' is not an output");
    cfg.outputs = keep;
  }

  const InputBuf &sec = cfg.secret();
  if (cfg.secretByteOff() + cfg.secretWordSize > sec.active)
    throw runtime_error("--secret-pos " + to_string(cfg.secretPos) +
                        " is outside the active length (" +
                        to_string(sec.active) + " bytes) of '" + sec.param +
                        "'");
  return cfg;
}

inline string dist_desc(const InputBuf &in, long bgFieldMod) {
  switch (in.dist.kind) {
  case Dist::Cbd:
    return "int16 coeffs in [-" + to_string(in.dist.extra) + ", " +
           to_string(in.dist.extra) + "]";
  case Dist::PolyModQ:
    return "int16 coeffs in [0, " + to_string(KYBER_Q - 1) + "]";
  case Dist::PolySigned:
    return "int16 coeffs in [-" + to_string(in.dist.extra) + ", " +
           to_string(in.dist.extra) + "]";
  case Dist::MessagePoly:
    return "int16 coeffs in {0, " + to_string((KYBER_Q + 1) / 2) + "}";
  case Dist::Bytes:
    return "bytes";
  default:
    return bgFieldMod < 256 ? "bytes in [0, " + to_string(bgFieldMod - 1) + "]"
                            : "bytes";
  }
}

inline void print_config(const FuncConfig &cfg, std::ostream &o) {
  for (auto &in : cfg.inputs)
    o << "[arg] " << in.param
      << (in.scalar ? " -> symbolic scalar (" + to_string(in.bits) + "-bit)"
                    : " -> region " + in.region + " [" + to_string(in.start) +
                          ".." + to_string(in.start + in.regionLen - 1) + "]")
      << ", " << in.active << " active byte(s), " << dist_desc(in, cfg.bgFieldMod)
      << (in.secret ? "  <-- SECRET, " +
                          string(cfg.secretWordSize == 2 ? "coefficient "
                                                         : "byte ") +
                          to_string(cfg.secretPos) + " swept over " +
                          to_string(cfg.secretValues.size()) + " value(s) " +
                          join_vals(cfg.secretValues, 6)
                    : string())
      << (in.eph ? "  <-- EPHEMERAL secret" : "") << "\n";
  for (auto &out : cfg.outputs)
    o << "[out] " << out.param << " -> region " << out.region << " ["
      << out.start << ".." << out.start + out.length - 1 << "], "
      << out.words() << " word(s) of " << out.wordSize << " byte(s), diff "
      << (out.modSub ? "mod-sub (mod " + to_string(cfg.modulus) + ")"
                     : string("xor"))
      << "\n";
  for (auto &n : cfg.notes)
    o << "[note] " << n << "\n";
}

// =====================================================================
// Trace preparation: truncate after the definitions, make the driver's
// inputs symbolic, and remember every declared symbol for per-copy renaming.
// =====================================================================

struct PreparedTrace {
  string text;     // declarations + asserts, no commands
  string finalMem; // Final_Memory symbol (pre-renaming)
  map<string, string> inArray; // input region -> symbolic array name
  // scalar output anchor -> (final SSA bit-vector symbol, width): llvmbmc
  // keeps a scalar global such as __mbc_ret_anchor_<fn> in registers
  // (bv_<N>_<anchor>_<suffix>), not in Global_M.
  map<string, pair<string, unsigned>> scalarFinal;
  std::unordered_set<string> symbols;
  // scalar input param -> (bv_<N>_nondet symbol, width)
  map<string, pair<string, unsigned>> nondetScalar;
  // Bit-vector symbols with no defining equation (e.g. the value of an
  // `undef` fault): (name, width). One faulty binary has one such
  // behaviour, so each is shared by every trace copy as part of p.
  vector<pair<string, unsigned>> freeSymbols;
  vector<string> log;
};

inline string head_token(const string &sx) {
  size_t i = 1;
  while (i < sx.size() && isspace((unsigned char)sx[i]))
    i++;
  size_t j = i;
  while (j < sx.size() && !isspace((unsigned char)sx[j]) && sx[j] != '(' &&
         sx[j] != ')')
    j++;
  return sx.substr(i, j - i);
}

inline string second_token(const string &sx) {
  string h = head_token(sx);
  size_t i = sx.find(h) + h.size();
  while (i < sx.size() && isspace((unsigned char)sx[i]))
    i++;
  size_t j = i;
  while (j < sx.size() && !isspace((unsigned char)sx[j]) && sx[j] != '(' &&
         sx[j] != ')')
    j++;
  return sx.substr(i, j - i);
}

// Rewrites the zero-fill lambda(s) of input regions inside one assert.
inline bool rewrite_input_lambdas(string &a, const FuncConfig &cfg,
                                  bool faulty, set<string> &initialized,
                                  PreparedTrace &P) {
  static const string open = "(lambda ((";
  static const string zero = "(_ bv0 8)";
  static const std::regex k64(R"(\(_ bv(\d+) 64\))");
  bool changed = false;
  size_t p = 0;
  while ((p = a.find(open, p)) != string::npos) {
    size_t lamEnd = match_paren(a, p);
    size_t q = p + open.size();
    size_t qe = q;
    while (qe < a.size() && !isspace((unsigned char)a[qe]) && a[qe] != ')')
      qe++;
    string cell = a.substr(q, qe - q);
    size_t ite = a.find("(ite ", qe);
    p++;
    if (lamEnd == string::npos || ite == string::npos || ite > lamEnd)
      continue;
    size_t c0 = ite + 5;
    while (c0 < a.size() && isspace((unsigned char)a[c0]))
      c0++;
    if (a[c0] != '(')
      continue;
    size_t c1 = match_paren(a, c0);
    if (c1 == string::npos)
      continue;
    size_t t0 = c1 + 1;
    while (t0 < a.size() && isspace((unsigned char)a[t0]))
      t0++;
    if (a.compare(t0, zero.size(), zero) != 0)
      continue;

    string cond = a.substr(c0, c1 - c0 + 1);
    set<uint64_t> ks;
    for (auto it = std::sregex_iterator(cond.begin(), cond.end(), k64);
         it != std::sregex_iterator(); ++it)
      ks.insert(std::stoull((*it)[1].str()));

    for (auto &in : cfg.inputs) {
      if (in.scalar)
        continue;
      uint64_t endEx = in.start + in.regionLen;
      bool match = in.start == 0 ? (ks == set<uint64_t>{endEx})
                                 : (ks == set<uint64_t>{in.start, endEx});
      if (!match || initialized.count(in.region))
        continue;
      string arr = "__in_" + in.region + (faulty ? "_faulty" : "_correct");
      string repl = "(ite (bvult " + cell + " (_ bv" +
                    to_string(in.start + in.active) + " 64)) (select " + arr +
                    " " + cell + ") (_ bv0 8))";
      a.replace(t0, zero.size(), repl);
      initialized.insert(in.region);
      P.inArray[in.region] = arr;
      P.log.push_back("input '" + in.param + "' (" + in.region +
                      "): zero-fill replaced by symbolic " + arr + " over [" +
                      to_string(in.start) + ".." +
                      to_string(in.start + in.active - 1) + "]");
      changed = true;
      break;
    }
  }
  return changed;
}

inline PreparedTrace prepare_trace(const string &raw, const TraceLayout &L,
                                   const FuncConfig &cfg, bool faulty) {
  PreparedTrace P;
  P.finalMem = L.finalMem;

  // ---- split into top-level s-expressions, stop at the first command ----
  vector<string> decls, asserts;
  size_t i = 0;
  while (i < raw.size()) {
    char c = raw[i];
    if (isspace((unsigned char)c)) {
      i++;
      continue;
    }
    if (c == ';') {
      while (i < raw.size() && raw[i] != '\n')
        i++;
      continue;
    }
    if (c != '(') {
      i++;
      continue;
    }
    size_t e = match_paren(raw, i);
    if (e == string::npos)
      throw runtime_error("Unbalanced parentheses in trace");
    string sx = raw.substr(i, e - i + 1);
    i = e + 1;
    string head = head_token(sx);
    if (head == "assert") {
      if (second_token(sx) == "and" && sx.find('(', 1) == string::npos)
        continue; // `(assert and)` -- empty conjunction emitted by llvmbmc
      asserts.push_back(sx);
    } else if (head == "declare-fun" || head == "declare-const") {
      P.symbols.insert(second_token(sx));
      decls.push_back(sx);
    } else if (head == "set-info" || head == "set-option" ||
               head == "set-logic" || head == "define-sort") {
      decls.push_back(sx);
    } else {
      break; // (check-sat) / (push) ...: property checks follow
    }
  }

  // Final SSA version of every scalar output anchor held as a bit-vector.
  for (auto &o : cfg.outputs) {
    std::regex re("^bv_(\\d+)_" + o.region + (faulty ? "_faulty" : "_correct") +
                  "$");
    long best = -1;
    for (auto &d : decls) {
      string name = second_token(d);
      std::smatch m;
      if (!std::regex_match(name, m, re))
        continue;
      long n = std::stol(m[1].str());
      std::smatch w;
      static const std::regex bvw(R"(\(_ BitVec (\d+)\)\)\s*$)");
      if (n > best && std::regex_search(d, w, bvw)) {
        best = n;
        P.scalarFinal[o.region] = {name, (unsigned)std::stoul(w[1].str())};
      }
    }
    if (best >= 0)
      P.log.push_back("output '" + o.param + "' read from scalar SSA symbol " +
                      P.scalarFinal[o.region].first);
    else if (!L.find(o.region))
      throw runtime_error("output '" + o.param + "': '" + o.region +
                          "' is neither a memory region nor a bit-vector "
                          "symbol of the " +
                          (faulty ? "faulty" : "correct") + " trace");
  }

  const string memSortTxt = "(Array (_ BitVec 64) (_ BitVec 8))";
  if (!L.initialMem.empty()) {
    for (auto &d : decls)
      if (second_token(d) == L.initialMem && d.find(memSortTxt) == string::npos)
        throw runtime_error("Memory '" + L.initialMem + "' is not " +
                            memSortTxt +
                            " -- regenerate the traces with ./run_faults.sh "
                            "(llvmbmc --memory-granularity 8)");
  }

  // ---- rewrite the driver prelude ----
  static const std::regex scalarInit(
      R"(^\(assert\s*\(=\s*bv_\S+\s+\(_ bv\d+ \d+\)\)\)$)");
  static const std::regex constStore(
      R"(^\(assert\s*\(=\s*(\S+)\s+\(store\s+(\S+)\s+\(_ bv(\d+) 64\)\s+\(_ bv\d+ 8\)\)\)\)$)");
  set<string> initialized;
  bool prelude = true;
  size_t droppedStores = 0;
  for (auto &a : asserts) {
    if (!prelude)
      continue;
    if (second_token(a) == "true" && a.find('(', 1) == string::npos)
      continue; // `(assert true)`
    if (a.size() < 200 && std::regex_match(a, scalarInit))
      continue; // initial value of a scalar global (e.g. the return anchor)
    if (a.find("(lambda ((") != string::npos) {
      rewrite_input_lambdas(a, cfg, faulty, initialized, P);
      continue;
    }
    std::smatch m;
    if (a.size() < 400 && std::regex_match(a, m, constStore)) {
      uint64_t addr = std::stoull(m[3].str());
      bool intoActive = false;
      for (auto &in : cfg.inputs)
        intoActive |= !in.scalar && addr >= in.start &&
                      addr < in.start + in.active;
      if (intoActive) {
        a = "(assert (= " + m[1].str() + " " + m[2].str() + "))";
        droppedStores++;
      }
      continue;
    }
    prelude = false;
  }
  // Symbolic scalar arguments. fault-types/bmc_variant.h reads every
  // non-fixed scalar via __VERIFIER_nondet_iN (-> bv_<K>_nondet) and stores
  // it back to its anchor, which leaves the link
  //   (= bv_<M>___mbc_arg_<fn>_<param>_<sfx> bv_<K>_nondet)
  // in the trace. A parameter without that link in a trace that has links
  // is unused there and needs no binding. Traces from before the write-back:
  // nondets in argument order, if all present. No nondet at all: the scalars
  // were folded to constants.
  {
    static const std::regex ndDecl(
        R"(^\(declare-fun\s+(bv_(\d+)_nondet)\s+\(\)\s+\(_ BitVec (\d+)\)\)$)");
    map<string, unsigned> ndWidth;
    vector<pair<long, string>> ndOrder;
    for (auto &d : decls) {
      std::smatch m;
      if (std::regex_match(d, m, ndDecl)) {
        ndWidth[m[1].str()] = (unsigned)std::stoul(m[3].str());
        ndOrder.push_back({std::stol(m[2].str()), m[1].str()});
      }
    }
    std::sort(ndOrder.begin(), ndOrder.end());
    vector<const InputBuf *> scalars;
    for (auto &in : cfg.inputs)
      if (in.scalar)
        scalars.push_back(&in);

    const string sfx = faulty ? "_faulty" : "_correct";
    bool anyLink = false;
    for (auto *in : scalars) {
      std::regex link(R"(\(=\s+bv_\d+___mbc_arg_)" + cfg.fn + "_" + in->param +
                      sfx + R"(\s+(bv_\d+_nondet)\s*\))");
      for (auto &a : asserts) {
        std::smatch m;
        if (a.size() < 300 && std::regex_search(a, m, link)) {
          P.nondetScalar[in->param] = {m[1].str(), ndWidth[m[1].str()]};
          anyLink = true;
          break;
        }
      }
    }
    if (!anyLink && ndOrder.size() == scalars.size())
      for (size_t k = 0; k < scalars.size(); k++)
        P.nondetScalar[scalars[k]->param] = {ndOrder[k].second,
                                             ndWidth[ndOrder[k].second]};

    bool regenerated = anyLink || !ndOrder.empty();
    if (!anyLink && regenerated && ndOrder.size() != scalars.size())
      throw runtime_error(
          "trace has " + to_string(ndOrder.size()) +
          " bv_<N>_nondet symbol(s) but " + to_string(scalars.size()) +
          " non-fixed scalar argument(s), and no anchor links to map them -- "
          "regenerate the traces with the current fault-types generators");
    for (auto *in : scalars) {
      auto it = P.nondetScalar.find(in->param);
      if (it != P.nondetScalar.end()) {
        if (it->second.second != in->bits)
          throw runtime_error("nondet symbol " + it->second.first + " is " +
                              to_string(it->second.second) +
                              "-bit but scalar '" + in->param + "' is " +
                              to_string(in->bits) + "-bit");
        P.log.push_back("scalar '" + in->param +
                        "' is symbolic: " + it->second.first);
      } else if (regenerated) {
        P.log.push_back("scalar '" + in->param +
                        "' does not influence this trace (unused)");
      } else if (in->secret && !faulty) {
        throw runtime_error(
            "secret '" + in->param +
            "' is a scalar argument folded to a constant in this trace (no "
            "bv_<N>_nondet symbol). Regenerate the traces with the current "
            "fault-types generators (./run_faults.sh " + cfg.fn + ")");
      } else {
        P.log.push_back("scalar '" + in->param +
                        "' is not in fixed-scalars (the simulation randomizes "
                        "it) but is folded to a constant or unused in this "
                        "trace");
      }
    }
  }

  // Free bit-vector symbols: declared, never the left side of an equation.
  {
    static const std::regex bvDecl(
        R"(^\(declare-fun\s+(\S+)\s+\(\)\s+\(_ BitVec (\d+)\)\)$)");
    string all;
    for (auto &a : asserts)
      all += a;
    for (auto &d : decls) {
      std::smatch m;
      if (!std::regex_match(d, m, bvDecl))
        continue;
      string name = m[1].str();
      bool isOut = false;
      for (auto &kv : P.scalarFinal)
        isOut |= kv.second.first == name;
      for (auto &kv : P.nondetScalar)
        isOut |= kv.second.first == name;
      if (isOut || all.find("(= " + name + " ") != string::npos ||
          all.find("(= " + name + "\n") != string::npos ||
          all.find(name) == string::npos)
        continue;
      P.freeSymbols.push_back({name, (unsigned)std::stoul(m[2].str())});
      P.log.push_back("free symbol " + name + " (" + m[2].str() +
                      "-bit, no defining equation, e.g. an undef fault "
                      "value): shared by all copies as part of p");
    }
  }
  if (droppedStores)
    P.log.push_back("dropped " + to_string(droppedStores) +
                    " constant driver store(s) into active input bytes");
  for (auto &in : cfg.inputs)
    if (!in.scalar && in.active > 0 && !initialized.count(in.region))
      throw runtime_error(
          "Could not find the driver's zero-fill (kyber_memset lambda) for "
          "input region '" +
          in.region + "' in the " + (faulty ? "faulty" : "correct") +
          " trace, so it cannot be made symbolic -- regenerate the traces "
          "with ./run_faults.sh (llvmbmc --rewrite-mem-loops)");

  std::ostringstream o;
  for (auto &d : decls)
    o << d << "\n";
  for (auto &kv : P.inArray) {
    o << "(declare-fun " << kv.second << " () " << memSortTxt << ")\n";
    P.symbols.insert(kv.second);
  }
  for (auto &a : asserts)
    o << a << "\n";
  P.text = o.str();
  return P;
}

// Renames every declared symbol to <symbol>__<tag>, so several copies of the
// same trace can live in one solver.
inline string rename_copy(const PreparedTrace &P, const string &tag) {
  const string &s = P.text;
  string out;
  out.reserve(s.size() + s.size() / 8);
  size_t i = 0;
  auto delim = [](char c) {
    return c == '(' || c == ')' || isspace((unsigned char)c);
  };
  while (i < s.size()) {
    if (delim(s[i])) {
      out += s[i++];
      continue;
    }
    size_t j = i;
    while (j < s.size() && !delim(s[j]))
      j++;
    string tok = s.substr(i, j - i);
    out += tok;
    if (P.symbols.count(tok))
      out += "__" + tag;
    i = j;
  }
  return out;
}

// Same formula once _correct/_faulty is normalized away -> the fault is not
// encoded in the trace at all.
inline bool traces_identical(const PreparedTrace &c, const PreparedTrace &f) {
  // Linear: in-place replace() would be quadratic on multi-MB traces.
  auto norm = [](const string &s, const string &suf) {
    string out;
    out.reserve(s.size());
    size_t p = 0;
    while (true) {
      size_t q = s.find(suf, p);
      if (q == string::npos) {
        out.append(s, p, string::npos);
        break;
      }
      out.append(s, p, q - p);
      out += "_X";
      p = q + suf.size();
    }
    return out;
  };
  return norm(c.text, "_correct") == norm(f.text, "_faulty");
}

// =====================================================================
// One solver holding one or more (correct, faulty) trace copies.
// =====================================================================

// Time limits for one faulty trace: every solver call is capped at
// timeoutMs, and once the per-fault wall-clock budget is spent no further
// calls are made -- they return UNKNOWN, reported as such.
struct Budget {
  unsigned timeoutMs = 30000;
  bool limited = false;
  std::chrono::steady_clock::time_point deadline;
  std::atomic<unsigned> timeouts{0}; // checks that hit timeoutMs
  std::atomic<unsigned> skipped{0};  // checks not run: budget exhausted

  Budget(unsigned timeoutMs_, unsigned faultTimeoutS) : timeoutMs(timeoutMs_) {
    limited = faultTimeoutS > 0;
    deadline = std::chrono::steady_clock::now() +
               std::chrono::seconds(faultTimeoutS);
  }
  bool exhausted() const {
    return limited && std::chrono::steady_clock::now() >= deadline;
  }
  string summary() const {
    std::ostringstream o;
    if (timeouts)
      o << "[!] " << timeouts << " solver check(s) hit the per-check timeout ("
        << timeoutMs << " ms) -- raise --timeout\n";
    if (skipped)
      o << "[!] per-fault budget exhausted: " << skipped
        << " check(s) not run -- raise --fault-timeout\n";
    return o.str();
  }
};

// Concrete values of the shared public variables (p_* and u_*) of one model,
// used to pin p in a later instance.
using Pin = map<string, uint64_t>;

class Instance {
public:
  z3::context ctx;
  z3::solver slv;

  // Every trace address is a constant, so simplify + solve-eqs turn the
  // memory SSA chain (stores, zero-fill lambdas) into plain bit-vector
  // terms over the inputs before solving; far faster than giving the
  // array formula to the default solver.
  // try_for bounds the whole tactic pipeline: the solver's own "timeout"
  // parameter is not honoured by every tactic.
  static z3::solver make_solver(z3::context &c, unsigned timeoutMs) {
    z3::tactic pre = z3::tactic(c, "simplify") &
                     z3::tactic(c, "propagate-values") &
                     z3::tactic(c, "solve-eqs") & z3::tactic(c, "simplify");
    z3::tactic core = z3::cond(z3::probe(c, "is-qfbv"), z3::tactic(c, "qfbv"),
                               z3::tactic(c, "smt"));
    return z3::try_for(pre & core, timeoutMs).mk_solver();
  }

  Instance(const FuncConfig &cfg, Budget &budget, const Pin *pin = nullptr)
      : slv(make_solver(ctx, budget.timeoutMs)),
        memSort_(ctx.array_sort(ctx.bv_sort(64), ctx.bv_sort(8))),
        cfg_(cfg), budget_(budget), pin_(pin) {
    z3::params p(ctx);
    p.set("timeout", budget.timeoutMs);
    slv.set(p);
  }

  // slv.check() under the time limits; a timeout or a skipped check is
  // UNKNOWN.
  z3::check_result check() {
    if (budget_.exhausted()) {
      budget_.skipped++;
      return z3::unknown;
    }
    z3::check_result r;
    try {
      r = slv.check();
    } catch (const z3::exception &) {
      r = z3::unknown; // tactic failure, e.g. try_for timeout
    }
    if (r == z3::unknown)
      budget_.timeouts++;
    return r;
  }

  void add_trace(const PreparedTrace &P, const string &tag) {
    string t = rename_copy(P, tag);
    z3::expr_vector v = ctx.parse_string(t.c_str());
    for (unsigned i = 0; i < v.size(); i++)
      slv.add(v[i]);
    for (auto &fs_ : P.freeSymbols) {
      string uname = "u_" + fs_.first;
      z3::expr shared = ctx.bv_const(uname.c_str(), fs_.second);
      if (!shared_.count(uname)) {
        shared_.emplace(uname, shared);
        if (pin_ && pin_->count(uname))
          slv.add(shared == ctx.bv_val(pin_->at(uname), fs_.second));
      }
      slv.add(ctx.bv_const((fs_.first + "__" + tag).c_str(), fs_.second) ==
              shared);
    }
  }

  // The public background of a model: active values of every non-eph input
  // (shared p variables only), as "<param>=[..]" lists.
  string describe_p(const z3::model &m, size_t perInput = 16) {
    std::ostringstream o;
    for (auto &in : cfg_.inputs) {
      if (in.eph)
        continue;
      vector<Slot> sl = in.slots();
      o << " " << in.param << "=[";
      for (size_t k = 0; k < sl.size() && k < perInput; k++) {
        auto it = shared_.find("p_" + in.key() + "_" + to_string(sl[k].off));
        o << (k ? ", " : "");
        if (it == shared_.end())
          o << "s"; // the swept secret coefficient
        else
          o << signed_val(eval_u(m, it->second), 8 * sl[k].bytes,
                          sl[k].bytes == 2);
      }
      if (sl.size() > perInput)
        o << ", ... +" << sl.size() - perInput;
      o << "]";
    }
    return o.str();
  }

  // Values of the shared public variables in model m (to pin p later).
  Pin snapshot_p(const z3::model &m) {
    Pin pin;
    for (auto &kv : shared_)
      pin[kv.first] = eval_u(m, kv.second);
    return pin;
  }

  // Binds every active input of copy `tag`. The swept secret coefficient is
  // the constant secret value; ephemeral buffers use variables prefixed by
  // ephKey (one set per copy in the ineffective eph query), everything else
  // the shared public variables p_<key>_<offset>.
  void bind_inputs(const PreparedTrace &P, const string &tag, long sval,
                   const string &ephKey = "") {
    for (auto &in : cfg_.inputs) {
      if (in.active == 0)
        continue;
      string prefix = (in.eph && !ephKey.empty()) ? ephKey + "_" : "p_";
      vector<z3::expr> bytes;
      for (const Slot &s : in.slots()) {
        z3::expr v =
            (in.secret && s.off == cfg_.secretByteOff())
                ? ctx.bv_val(cfg_.secretBits(sval), 8 * s.bytes)
                : input_var(prefix + in.key() + "_" + to_string(s.off), in, s);
        for (unsigned j = 0; j < s.bytes; j++)
          bytes.push_back(s.bytes == 1 ? v : v.extract(8 * j + 7, 8 * j));
      }
      if (in.scalar) {
        auto nd = P.nondetScalar.find(in.param);
        if (nd == P.nondetScalar.end())
          continue; // folded to a constant in this trace
        z3::expr v = ctx.bv_const((nd->second.first + "__" + tag).c_str(),
                                  nd->second.second);
        // Little-endian bytes, as the harness writes them.
        for (uint64_t i = 0; i < bytes.size(); i++)
          slv.add(v.extract((unsigned)(8 * i + 7), (unsigned)(8 * i)) ==
                  bytes[i]);
        continue;
      }
      z3::expr arr = mem(P.inArray.at(in.region) + "__" + tag);
      for (uint64_t i = 0; i < bytes.size(); i++)
        slv.add(z3::select(arr, ctx.bv_val((uint64_t)(in.start + i), 64)) ==
                bytes[i]);
    }
  }

  z3::expr out_byte(const PreparedTrace &P, const string &tag,
                    const OutputBuf &o, uint64_t pos) {
    auto sc = P.scalarFinal.find(o.region);
    if (sc != P.scalarFinal.end()) {
      if (8 * (pos + 1) > sc->second.second)
        return ctx.bv_val(0, 8); // narrower register than the witness says
      z3::expr v = ctx.bv_const((sc->second.first + "__" + tag).c_str(),
                                sc->second.second);
      return sc->second.second == 8
                 ? v
                 : v.extract((unsigned)(8 * pos + 7), (unsigned)(8 * pos));
    }
    return z3::select(mem(P.finalMem + "__" + tag),
                      ctx.bv_val((uint64_t)(o.start + pos), 64));
  }

  // Output word `w` (little-endian, o.wordSize bytes).
  z3::expr out_word(const PreparedTrace &P, const string &tag,
                    const OutputBuf &o, uint64_t w) {
    z3::expr v = out_byte(P, tag, o, w * o.wordSize);
    for (unsigned j = 1; j < o.wordSize; j++)
      v = z3::concat(out_byte(P, tag, o, w * o.wordSize + j), v);
    return v;
  }

  // Width of a correction delta for o.
  static unsigned delta_bits(const OutputBuf &o) {
    return o.modSub ? 34 : 8 * o.wordSize;
  }

  // Delta(s, p) at output word w, as compute_delta() in
  // ineffective_kyber.py: words decoded unsigned (1 byte) or signed (2/4),
  // then xor or (y1 - y2) mod modulus.
  z3::expr delta(const PreparedTrace &C, const string &ct,
                 const PreparedTrace &F, const string &ft, const OutputBuf &o,
                 uint64_t w) {
    z3::expr a = out_word(C, ct, o, w), b = out_word(F, ft, o, w);
    if (!o.modSub)
      return a ^ b;
    unsigned ext = 34 - 8 * o.wordSize;
    z3::expr ea = o.wordSize == 1 ? z3::zext(a, ext) : z3::sext(a, ext);
    z3::expr eb = o.wordSize == 1 ? z3::zext(b, ext) : z3::sext(b, ext);
    return z3::smod(ea - eb, ctx.bv_val((uint64_t)cfg_.modulus, 34));
  }

  static uint64_t eval_u(const z3::model &m, const z3::expr &e) {
    return m.eval(e, true).get_numeral_uint64();
  }
  // Two's-complement reading of an n-bit value when isSigned.
  static long long signed_val(uint64_t v, unsigned bits, bool isSigned) {
    if (!isSigned || bits >= 64 || !(v >> (bits - 1) & 1))
      return (long long)v;
    return (long long)v - (long long)(1ULL << bits);
  }

private:
  z3::sort memSort_;
  const FuncConfig &cfg_;
  Budget &budget_;
  const Pin *pin_;
  map<string, z3::expr> vars_;   // every input variable of this instance
  map<string, z3::expr> shared_; // the public p_*/u_* ones

  z3::expr mem(const string &name) {
    return ctx.constant(name.c_str(), memSort_);
  }

  // A fresh input variable, constrained to the domain the simulation's
  // sample_for_distribution() draws this slot from.
  z3::expr input_var(const string &name, const InputBuf &in, const Slot &s) {
    auto it = vars_.find(name);
    if (it != vars_.end())
      return it->second;
    unsigned bits = 8 * s.bytes;
    z3::expr v = ctx.bv_const(name.c_str(), bits);
    if (s.bytes == 2) {
      switch (in.dist.kind) {
      case Dist::Cbd:
      case Dist::PolySigned:
        slv.add(z3::sge(v, ctx.bv_val((int)-in.dist.extra, 16)) &&
                z3::sle(v, ctx.bv_val((int)in.dist.extra, 16)));
        break;
      case Dist::PolyModQ:
        slv.add(z3::sge(v, ctx.bv_val(0, 16)) &&
                z3::slt(v, ctx.bv_val((int)KYBER_Q, 16)));
        break;
      case Dist::MessagePoly:
        slv.add(v == ctx.bv_val(0, 16) ||
                v == ctx.bv_val((int)(KYBER_Q + 1) / 2, 16));
        break;
      default:
        break;
      }
    } else if (in.dist.kind == Dist::Unknown && cfg_.bgFieldMod < 256) {
      slv.add(z3::ult(v, ctx.bv_val((unsigned)cfg_.bgFieldMod, 8)));
    }
    if (starts_with(name, "p_")) {
      shared_.emplace(name, v);
      if (pin_) {
        auto p = pin_->find(name);
        if (p != pin_->end())
          slv.add(v == ctx.bv_val(p->second, bits));
      }
    }
    vars_.emplace(name, v);
    return v;
  }
};

inline const char *res_str(z3::check_result r) {
  return r == z3::sat ? "SAT" : r == z3::unsat ? "UNSAT" : "UNKNOWN";
}

// =====================================================================
// Command line + per-function driver shared by both queries
// =====================================================================

struct Options {
  string fn;
  string testDir = "../../tests_kyber";
  string kyberJson = "../../../../test_qemu/kyber.json";
  ConfigOverrides ov;
  string faultFilter;
  long long positions = -1;
  unsigned jobs = 16;
  unsigned timeoutMs = 30000;   // per solver check
  unsigned faultTimeoutS = 600; // per faulty trace, 0 = unlimited
  bool verbose = false;
};

inline string usage(const string &prog) {
  return "Usage: " + prog +
         " <func_name> [--secret-buf NAME] [--secret-pos POS]\n"
         "       [--field-mod N (max swept secret values, default 256)]\n"
         "       [--out-buf NAME|all] [--out-word-size 1|2|4]\n"
         "       [--diff-mode xor|mod-sub] [--modulus N] [--kyber-k 2|3|4]\n"
         "       [--fault SUBSTR] [--positions N] [--jobs N]\n"
         "       [--timeout MS (per check, default 30000)]\n"
         "       [--fault-timeout S (per faulty trace, default 600, 0 = none)]\n"
         "       [--test-dir DIR] [--kyber-json PATH] [--verbose]\n"
         "  secret-buf / eph_secret / fixed-scalars come from kyber.json,\n"
         "  layout from <test-dir>/<fn>/qemu_witness.json and "
         "active_lengths.json\n";
}

inline Options parse_options(int argc, char **argv) {
  if (argc < 2 || string(argv[1]).rfind("-", 0) == 0)
    throw runtime_error(usage(argv[0]));
  Options o;
  o.fn = argv[1];
  for (int i = 2; i < argc; i++) {
    string a = argv[i];
    auto val = [&]() -> string {
      if (i + 1 >= argc)
        throw runtime_error("missing value for " + a);
      return argv[++i];
    };
    if (a == "--secret-buf")
      o.ov.secretBuf = val();
    else if (a == "--secret-pos")
      o.ov.secretPos = std::stoull(val());
    else if (a == "--field-mod")
      o.ov.fieldMod = std::stol(val());
    else if (a == "--out-buf")
      o.ov.outBuf = val();
    else if (a == "--out-word-size")
      o.ov.outWordSize = (unsigned)std::stoul(val());
    else if (a == "--diff-mode")
      o.ov.diffMode = val();
    else if (a == "--modulus")
      o.ov.modulus = std::stol(val());
    else if (a == "--kyber-k")
      o.ov.kyberK = std::stoi(val());
    else if (a == "--fault")
      o.faultFilter = val();
    else if (a == "--positions")
      o.positions = std::stoll(val());
    else if (a == "--jobs")
      o.jobs = (unsigned)std::stoul(val());
    else if (a == "--timeout")
      o.timeoutMs = (unsigned)std::stoul(val());
    else if (a == "--fault-timeout")
      o.faultTimeoutS = (unsigned)std::stoul(val());
    else if (a == "--test-dir")
      o.testDir = val();
    else if (a == "--kyber-json")
      o.kyberJson = val();
    else if (a == "--verbose")
      o.verbose = true;
    else
      throw runtime_error("unrecognized argument: " + a + "\n" +
                          usage(argv[0]));
  }
  if (o.ov.fieldMod < 2)
    throw runtime_error("--field-mod must be >= 2");
  if (o.ov.outWordSize && o.ov.outWordSize != 1 && o.ov.outWordSize != 2 &&
      o.ov.outWordSize != 4)
    throw runtime_error("--out-word-size must be 1, 2 or 4");
  if (!o.ov.diffMode.empty() && o.ov.diffMode != "xor" &&
      o.ov.diffMode != "mod-sub")
    throw runtime_error("--diff-mode must be xor or mod-sub");
  if (o.ov.modulus < 2 || o.ov.modulus >= (1L << 32))
    throw runtime_error("--modulus must be in [2, 2^32)");
  if (o.ov.kyberK && (o.ov.kyberK < 2 || o.ov.kyberK > 4))
    throw runtime_error("--kyber-k must be 2, 3 or 4");
  if (o.jobs == 0)
    o.jobs = 1;
  return o;
}

struct FaultJob {
  string path; // faulty .smt2
  string stem; // e.g. loopOrFuncSkip/<fn>_fnSkip_<callee>_line7
  PreparedTrace trace;
};

struct FunctionSetup {
  Options opts;
  string fnDir;
  FuncConfig cfg;
  TraceLayout layout; // of the correct trace
  PreparedTrace correct;
  vector<string> faultyPaths;
  const vector<OutputBuf> &outputs() const { return cfg.outputs; }
};

inline FunctionSetup load_function(const Options &opts) {
  FunctionSetup S;
  S.opts = opts;
  S.fnDir = (fs::path(opts.testDir) / opts.fn).string();
  string correctPath = (fs::path(S.fnDir) / (opts.fn + ".smt2")).string();
  string witnessPath = (fs::path(S.fnDir) / "qemu_witness.json").string();
  string activePath = (fs::path(S.fnDir) / "active_lengths.json").string();

  std::cout << "[i] function:       " << opts.fn << "\n"
            << "[i] correct trace:  " << correctPath << "\n"
            << "[i] kyber.json:     " << opts.kyberJson << "\n"
            << "[i] witness:        " << witnessPath << "\n"
            << "[i] active lengths: " << activePath << "\n";

  string raw = read_file(correctPath);
  TraceLayout L = parse_trace_layout(raw);
  S.layout = L;
  S.cfg = resolve_config(opts.fn, opts.kyberJson, witnessPath, activePath, L,
                         opts.ov);
  print_config(S.cfg, std::cout);

  S.correct = prepare_trace(raw, L, S.cfg, false);
  for (auto &l : S.correct.log)
    std::cout << "[trace] " << l << "\n";

  // Faulty traces: every .smt2 under the fault-category directories
  // (recursively), skipping whole-program gated builds -- the same set
  // run_combined_unicorn.sh discovers as faulty ELFs.
  static const vector<string> cats = {"loopOrFuncSkip", "binOpFault",
                                      "loadStoreSkip"};
  for (auto &c : cats) {
    fs::path d = fs::path(S.fnDir) / c;
    if (!fs::is_directory(d))
      continue;
    for (auto &e : fs::recursive_directory_iterator(d)) {
      string p = e.path().string();
      if (!e.is_regular_file() || e.path().extension() != ".smt2" ||
          p.find("full_kyber_gated") != string::npos)
        continue;
      if (!opts.faultFilter.empty() &&
          p.find(opts.faultFilter) == string::npos)
        continue;
      S.faultyPaths.push_back(p);
    }
  }
  std::sort(S.faultyPaths.begin(), S.faultyPaths.end());
  if (S.faultyPaths.empty())
    throw runtime_error("no faulty .smt2 traces found under " + S.fnDir +
                        "/{loopOrFuncSkip,binOpFault,loadStoreSkip}");
  std::cout << "[i] faulty traces:  " << S.faultyPaths.size() << "\n";
  for (auto &p : S.faultyPaths)
    std::cout << "      - " << fs::relative(p, S.fnDir).string() << "\n";
  return S;
}

inline FaultJob load_fault(const FunctionSetup &S, const string &path) {
  FaultJob J;
  J.path = path;
  string rel = fs::relative(path, S.fnDir).string();
  J.stem = rel.substr(0, rel.size() - 5); // drop .smt2
  string raw = read_file(path);
  TraceLayout Lf = parse_trace_layout(raw);
  check_layouts_match(S.layout, Lf);
  J.trace = prepare_trace(raw, Lf, S.cfg, true);
  return J;
}

// Number of output words analysed -- as early_stop_sweep_unicorn.py: the
// output buffer's whole length in words, unless capped by --positions.
inline uint64_t num_positions(const FunctionSetup &S, const OutputBuf &o) {
  uint64_t n = o.words();
  if (S.opts.positions >= 0)
    n = std::min<uint64_t>(n, (uint64_t)S.opts.positions);
  return n;
}

// <fnDir>/<fault stem>[_<out>]/<name> -- next to the simulation's
// test_result.txt for the same fault.
inline string result_path(const FunctionSetup &S, const FaultJob &J,
                          const OutputBuf &o, const string &name) {
  string dir = J.stem;
  if (S.cfg.outputs.size() > 1)
    dir += "_" + o.param;
  fs::path d = fs::path(S.fnDir) / dir;
  fs::create_directories(d);
  return (d / name).string();
}

} // namespace kyber_smt
