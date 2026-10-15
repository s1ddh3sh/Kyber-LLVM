// ineffective_multi_query.cpp -- SMT version of the ineffective test of
// test_qemu/dist_tests/kyber/early_stop_sweep_unicorn.py for one Kyber
// function.
//
//   ./ineffective_query <func_name> [options]      (see kyber_smt.h usage)
//
// Parameters come from kyber.json / qemu_witness.json / active_lengths.json
// exactly as in run_combined_unicorn.sh. With s = secret_buf[secret_pos]
// swept over domain_values(), p = every other input, r = the eph_secret
// buffer(s), and d(s,p) = (y_correct == y_faulty) at one output word, the
// query is (dist_tests/common/ineffective.py):
//
//   no eph : forall p exists s1,s2 : d(s1,p) and not d(s2,p)
//   eph    : forall p exists s1,s2 : (forall r d(s1,r,p)) and
//                                    (forall r not d(s2,r,p))
//
// Unlike the simulation, p (and r) are not sampled: they are symbolic, so a
// LEAK verdict holds for every public background, not just the seeds tried,
// and "no leak" is a proof rather than an absence of hits.
//
// Stage 1 (one correct+faulty copy per s): decide for each (s, pos) whether
//   d can be true / can be false over all (p, r). An s that is ineffective
//   for every (p, r) plus one that is effective for every (p, r) proves the
//   leak directly; all-ineffective / all-effective disproves it.
// Stage 1b (only for positions stage 1 leaves open): the negation of the
//   query is   exists p : [forall s exists r : not d] or [forall s exists r : d]
//   First try it at a few concrete backgrounds p0 (taken from stage-1
//   models): one copy per s with p pinned to p0 -- cheap, and it settles the
//   common case of positions the secret does not influence.
// Stage 2 (positions still open): the same two disjuncts as SAT problems
//   over one trace copy per s (shared p, per-copy r):
//     A: exists p, r_s : AND_s not d(s, r_s, p)
//     B: exists p, r_s : AND_s d(s, r_s, p)
//   LEAK iff both are UNSAT. Copies already known to satisfy their
//   conjunct for every (p, r) are dropped.
#include "kyber_smt.h"

using namespace kyber_smt;
using std::cerr;
using std::cout;

namespace {

enum Tri : int8_t { T_NO = 0, T_YES = 1, T_UNK = 2, T_UNSET = 3 };

struct PosFlags {
  Tri canIneff = T_UNSET; // exists (p, r): d
  Tri canEff = T_UNSET;   // exists (p, r): not d
};

// flags[s index][out][pos]
using Flags = vector<vector<vector<PosFlags>>>;
// want[out][pos]: positions to decide (empty = all)
using Mask = vector<vector<char>>;

z3::expr ineffective(Instance &I, const PreparedTrace &C, const string &ct,
                     const PreparedTrace &F, const string &ft,
                     const OutputBuf &o, uint64_t pos) {
  return I.out_word(C, ct, o, pos) == I.out_word(F, ft, o, pos);
}

// Fills canIneff / canEff for every wanted position. Each SAT model is a
// concrete (p, r) and is absorbed everywhere; goals are batched (all at
// once, then "at least one") so one UNSAT answer closes every remaining
// position of a kind.
// phasePins (optional) receives the background of the first model found
// while looking for ineffective (0) / effective (1) positions.
void resolve_flags(Instance &I, const vector<vector<z3::expr>> &d,
                   vector<vector<PosFlags>> &flags, const Mask *want,
                   vector<Pin> *phasePins = nullptr) {
  auto wanted = [&](size_t oi, size_t pos) {
    return !want || (*want)[oi][pos];
  };
  auto absorb = [&](const z3::model &m) {
    for (size_t oi = 0; oi < d.size(); oi++)
      for (size_t pos = 0; pos < d[oi].size(); pos++) {
        if (!wanted(oi, pos))
          continue;
        if (m.eval(d[oi][pos], true).is_true())
          flags[oi][pos].canIneff = T_YES;
        else
          flags[oi][pos].canEff = T_YES;
      }
  };
  auto goal = [&](int which, size_t oi, size_t pos) {
    return which == 0 ? d[oi][pos] : !d[oi][pos];
  };
  auto flag = [&](int which, size_t oi, size_t pos) -> Tri & {
    return which == 0 ? flags[oi][pos].canIneff : flags[oi][pos].canEff;
  };

  for (int which = 0; which < 2; which++) {
    bool triedAll = false, pinned = false;
    auto absorbPhase = [&](const z3::model &m) {
      if (phasePins && !pinned) {
        phasePins->push_back(I.snapshot_p(m));
        pinned = true;
      }
      absorb(m);
    };
    while (true) {
      vector<pair<size_t, size_t>> U;
      for (size_t oi = 0; oi < d.size(); oi++)
        for (size_t pos = 0; pos < d[oi].size(); pos++)
          if (wanted(oi, pos) && flag(which, oi, pos) == T_UNSET)
            U.push_back({oi, pos});
      if (U.empty())
        break;
      z3::expr_vector goals(I.ctx);
      for (auto &u : U)
        goals.push_back(goal(which, u.first, u.second));

      if (!triedAll && U.size() > 1) {
        triedAll = true;
        I.slv.push();
        I.slv.add(z3::mk_and(goals));
        z3::check_result r = I.check();
        if (r == z3::sat)
          absorbPhase(I.slv.get_model());
        I.slv.pop();
        if (r == z3::sat)
          continue;
      }
      I.slv.push();
      I.slv.add(z3::mk_or(goals));
      z3::check_result r = I.check();
      bool progress = false;
      if (r == z3::sat) {
        absorbPhase(I.slv.get_model());
        for (auto &u : U)
          progress |= flag(which, u.first, u.second) != T_UNSET;
      }
      I.slv.pop();
      if (r == z3::unsat) {
        for (auto &u : U)
          flag(which, u.first, u.second) = T_NO;
        break;
      }
      if (progress)
        continue;
      // Timeout (or a model that settles nothing): one check per position.
      for (auto &u : U) {
        Tri &t = flag(which, u.first, u.second);
        if (t != T_UNSET)
          continue;
        I.slv.push();
        I.slv.add(goal(which, u.first, u.second));
        z3::check_result rr = I.check();
        if (rr == z3::sat)
          absorbPhase(I.slv.get_model());
        else
          t = rr == z3::unsat ? T_NO : T_UNK;
        if (t == T_UNSET)
          t = T_UNK;
        I.slv.pop();
      }
      break;
    }
  }
}

// One correct+faulty copy for secret value index si. With pin, every public
// variable is fixed to p0 (eph inputs stay free); pinsOut receives candidate
// backgrounds for stage 1b: those of the first model and of the first
// model of each resolve phase.
void flags_for_secret(const FunctionSetup &S, const FaultJob &J, Budget &B,
                      size_t si, vector<vector<PosFlags>> &flags,
                      const Mask *want, const Pin *pin,
                      vector<Pin> *pinsOut) {
  const FuncConfig &cfg = S.cfg;
  long s = cfg.secretValues[si];
  Instance I(cfg, B, pin);
  I.add_trace(S.correct, "C");
  I.add_trace(J.trace, "F");
  string ephKey = pin ? "e" : "";
  I.bind_inputs(S.correct, "C", s, ephKey);
  I.bind_inputs(J.trace, "F", s, ephKey);

  vector<vector<z3::expr>> d(S.outputs().size());
  for (size_t oi = 0; oi < S.outputs().size(); oi++) {
    flags[oi].assign(num_positions(S, S.outputs()[oi]), PosFlags{});
    for (uint64_t pos = 0; pos < flags[oi].size(); pos++)
      d[oi].push_back(ineffective(I, S.correct, "C", J.trace, "F",
                                  S.outputs()[oi], pos));
  }

  z3::check_result r = I.check();
  if (r == z3::unsat)
    throw runtime_error("s=" + to_string(s) +
                        ": the trace is UNSAT for every input -- the trace "
                        "itself (or the input rewriting) is inconsistent");
  if (r == z3::sat) {
    z3::model m = I.slv.get_model();
    if (pinsOut)
      pinsOut->push_back(I.snapshot_p(m));
    for (size_t oi = 0; oi < d.size(); oi++)
      for (size_t pos = 0; pos < d[oi].size(); pos++)
        if (!want || (*want)[oi][pos])
          (m.eval(d[oi][pos], true).is_true() ? flags[oi][pos].canIneff
                                              : flags[oi][pos].canEff) = T_YES;
  }
  resolve_flags(I, d, flags, want, pinsOut);
}

// A (wantIneff=false): exists p, r_s: AND_s not d    B: AND_s d
z3::check_result stage2_check(const FunctionSetup &S, const FaultJob &J,
                              Budget &B, const OutputBuf &o, uint64_t pos,
                              const vector<int> &copies, bool wantIneff,
                              string &counterexample) {
  Instance I(S.cfg, B);
  for (int si : copies) {
    string ct = "C" + to_string(si), ft = "F" + to_string(si);
    string ephKey = "e" + to_string(si);
    long s = S.cfg.secretValues[si];
    I.add_trace(S.correct, ct);
    I.add_trace(J.trace, ft);
    I.bind_inputs(S.correct, ct, s, ephKey);
    I.bind_inputs(J.trace, ft, s, ephKey);
    z3::expr d = ineffective(I, S.correct, ct, J.trace, ft, o, pos);
    I.slv.add(wantIneff ? d : !d);
  }
  z3::check_result r = I.check();
  if (r == z3::sat)
    counterexample = I.describe_p(I.slv.get_model());
  if (r == z3::unknown)
    std::cout << "[!] stage2 check at pos " << pos << " UNKNOWN (timeout)\n"
              << std::flush;
  return r;
}

// "<param>=[..]" lists of a pinned background (as Instance::describe_p).
string describe_pin(const FuncConfig &cfg, const Pin &pin,
                    size_t perInput = 16) {
  std::ostringstream o;
  for (auto &in : cfg.inputs) {
    if (in.eph)
      continue;
    vector<Slot> sl = in.slots();
    o << " " << in.param << "=[";
    for (size_t k = 0; k < sl.size() && k < perInput; k++) {
      auto it = pin.find("p_" + in.key() + "_" + to_string(sl[k].off));
      o << (k ? ", " : "");
      if (it == pin.end())
        o << "s";
      else
        o << Instance::signed_val(it->second, 8 * sl[k].bytes,
                                  sl[k].bytes == 2);
    }
    if (sl.size() > perInput)
      o << ", ... +" << sl.size() - perInput;
    o << "]";
  }
  return o.str();
}

enum class Verdict { LeakUniform, LeakPDependent, NoLeak, Unknown };

struct PosResult {
  Verdict v = Verdict::Unknown;
  vector<long> alwaysIneff, alwaysEff; // secret values
  string reason;
};

struct Stage2Task {
  size_t oi;
  uint64_t pos;
  bool wantIneff;
  vector<int> copies; // secret value indices
  z3::check_result res = z3::unknown;
  string counterexample;
};

// Returns the [RESULT] line for this fault.
string run_fault(const FunctionSetup &S, const string &path) {
  const FuncConfig &cfg = S.cfg;
  const size_t NS = cfg.secretValues.size();
  FaultJob J = load_fault(S, path);
  cout << "\n########################################\n"
       << "# faulty trace: " << J.stem << "\n"
       << "########################################\n";
  for (auto &l : J.trace.log)
    cout << "[trace] " << l << "\n";
  bool identical = traces_identical(S.correct, J.trace);
  if (identical)
    cout << "[!] WARNING: this faulty trace is IDENTICAL to the correct one "
            "once _correct/_faulty is normalized -- the fault is not encoded "
            "in the SMT file; check trace generation for this fault site.\n";

  Budget B(S.opts.timeoutMs, S.opts.faultTimeoutS);
  auto t0 = std::chrono::steady_clock::now();
  auto elapsed = [&] {
    return std::chrono::duration<double>(std::chrono::steady_clock::now() - t0)
        .count();
  };
  size_t pairBytes = S.correct.text.size() + J.trace.text.size();

  // ---- stage 1 ----
  Flags st1(NS, vector<vector<PosFlags>>(S.outputs().size()));
  // Candidate backgrounds for stage 1b, from the first and last secret value.
  vector<Pin> pinsFirst, pinsLast;
  cout << "[stage1] " << NS << " secret values x 1 copy, " << S.opts.jobs
       << " job(s)\n"
       << std::flush;
  unsigned jobs1 = mem_safe_jobs(S.opts.jobs, pairBytes, "stage1");
  parallel_for(NS, jobs1, [&](size_t si) {
    flags_for_secret(S, J, B, si, st1[si], nullptr, nullptr,
                     si == 0 ? &pinsFirst : si == NS - 1 ? &pinsLast : nullptr);
  });
  cout << "[stage1] done in " << elapsed() << " s\n" << std::flush;

  // ---- per-position decision ----
  vector<vector<PosResult>> results(S.outputs().size());
  vector<vector<pair<vector<int>, vector<int>>>> open(S.outputs().size());
  Mask openMask(S.outputs().size());
  size_t nOpen = 0;
  for (size_t oi = 0; oi < S.outputs().size(); oi++) {
    uint64_t P = num_positions(S, S.outputs()[oi]);
    results[oi].resize(P);
    open[oi].resize(P);
    openMask[oi].assign(P, 0);
    for (uint64_t pos = 0; pos < P; pos++) {
      PosResult &R = results[oi][pos];
      vector<int> SA, SB; // copies for check A / B
      for (size_t si = 0; si < NS; si++) {
        const PosFlags &f = st1[si][oi][pos];
        if (f.canEff == T_NO)
          R.alwaysIneff.push_back(cfg.secretValues[si]);
        if (f.canIneff == T_NO)
          R.alwaysEff.push_back(cfg.secretValues[si]);
        if (f.canIneff != T_NO)
          SA.push_back((int)si);
        if (f.canEff != T_NO)
          SB.push_back((int)si);
      }
      if (!R.alwaysIneff.empty() && !R.alwaysEff.empty()) {
        R.v = Verdict::LeakUniform;
        continue;
      }
      if (R.alwaysIneff.size() == NS) {
        R.v = Verdict::NoLeak;
        R.reason = "every s is ineffective for every p";
        continue;
      }
      if (R.alwaysEff.size() == NS) {
        R.v = Verdict::NoLeak;
        R.reason = "every s is effective for every p";
        continue;
      }
      // A is already UNSAT if some s is always ineffective, B if some s is
      // always effective; a single remaining copy is decided by stage 1.
      bool needA = R.alwaysIneff.empty(), needB = R.alwaysEff.empty();
      if (needA && SA.size() == 1 && st1[SA[0]][oi][pos].canEff == T_YES) {
        R.v = Verdict::NoLeak;
        R.reason = "a p exists for which every s is effective";
        continue;
      }
      if (needB && SB.size() == 1 && st1[SB[0]][oi][pos].canIneff == T_YES) {
        R.v = Verdict::NoLeak;
        R.reason = "a p exists for which every s is ineffective";
        continue;
      }
      open[oi][pos] = {needA ? SA : vector<int>{}, needB ? SB : vector<int>{}};
      openMask[oi][pos] = 1;
      nOpen++;
    }
  }

  // ---- stage 1b: the open positions at concrete backgrounds p0 ----
  vector<Pin> pins;
  for (auto *v : {&pinsFirst, &pinsLast})
    for (auto &p : *v)
      if (!p.empty() && std::find(pins.begin(), pins.end(), p) == pins.end())
        pins.push_back(p);
  for (size_t pi = 0; pi < pins.size() && nOpen; pi++) {
    const Pin &p0 = pins[pi];
    cout << "[stage1b] " << nOpen << " open position(s): " << NS
         << " secret values x 1 copy at fixed background " << pi + 1 << "/"
         << pins.size() << "\n"
         << std::flush;
    Flags st1b(NS, vector<vector<PosFlags>>(S.outputs().size()));
    unsigned jobs = mem_safe_jobs(S.opts.jobs, pairBytes, "stage1b");
    parallel_for(NS, jobs, [&](size_t si) {
      flags_for_secret(S, J, B, si, st1b[si], &openMask, &p0, nullptr);
    });
    for (size_t oi = 0; oi < S.outputs().size(); oi++)
      for (uint64_t pos = 0; pos < open[oi].size(); pos++) {
        if (!openMask[oi][pos])
          continue;
        auto &SA = open[oi][pos].first, &SB = open[oi][pos].second;
        auto all = [&](const vector<int> &v, bool ineff) {
          for (int si : v) {
            const PosFlags &f = st1b[si][oi][pos];
            if ((ineff ? f.canIneff : f.canEff) != T_YES)
              return false;
          }
          return true;
        };
        PosResult &R = results[oi][pos];
        if (!SA.empty() && all(SA, false))
          R.reason = "at p0 every s is effective";
        else if (!SB.empty() && all(SB, true))
          R.reason = "at p0 every s is ineffective";
        else
          continue;
        R.v = Verdict::NoLeak;
        R.reason += ", p0:" + describe_pin(cfg, p0);
        openMask[oi][pos] = 0;
        nOpen--;
      }
    cout << "[stage1b] done in " << elapsed() << " s, " << nOpen
         << " position(s) left\n"
         << std::flush;
  }

  // ---- stage 2 ----
  vector<Stage2Task> tasks;
  for (size_t oi = 0; oi < S.outputs().size(); oi++)
    for (uint64_t pos = 0; pos < open[oi].size(); pos++) {
      if (!openMask[oi][pos])
        continue;
      if (!open[oi][pos].first.empty())
        tasks.push_back({oi, pos, false, open[oi][pos].first});
      if (!open[oi][pos].second.empty())
        tasks.push_back({oi, pos, true, open[oi][pos].second});
    }
  if (!tasks.empty()) {
    cout << "[stage2] " << tasks.size()
         << " multi-copy check(s) for positions stage 1 left open\n"
         << std::flush;
    size_t maxCopies = 0;
    for (auto &t : tasks)
      maxCopies = std::max(maxCopies, t.copies.size());
    unsigned jobs2 =
        mem_safe_jobs(S.opts.jobs, pairBytes * maxCopies, "stage2");
    parallel_for(tasks.size(), jobs2, [&](size_t k) {
      Stage2Task &t = tasks[k];
      t.res = stage2_check(S, J, B, S.outputs()[t.oi], t.pos, t.copies,
                           t.wantIneff, t.counterexample);
    });
  }
  map<pair<size_t, uint64_t>, vector<const Stage2Task *>> byPos;
  for (auto &t : tasks)
    byPos[{t.oi, t.pos}].push_back(&t);
  for (auto &kv : byPos) {
    PosResult &R = results[kv.first.first][kv.first.second];
    bool anySat = false, anyUnk = false;
    for (auto *t : kv.second) {
      if (t->res == z3::sat) {
        anySat = true;
        R.reason = string(t->wantIneff
                              ? "a p exists for which every s is ineffective"
                              : "a p exists for which every s is effective") +
                   ", e.g. p:" + t->counterexample;
      }
      anyUnk |= t->res == z3::unknown;
    }
    R.v = anySat    ? Verdict::NoLeak
          : anyUnk  ? Verdict::Unknown
                    : Verdict::LeakPDependent;
  }

  // ---- report ----
  string resultLine;
  for (size_t oi = 0; oi < S.outputs().size(); oi++) {
    const OutputBuf &o = S.outputs()[oi];
    std::ostringstream rep;
    uint64_t P = results[oi].size();
    rep << "[i] SMT ineffective query: " << J.stem << ", output '" << o.param
        << "' (" << P << " word(s) of " << o.wordSize << " byte(s))\n"
        << "[i] secret " << cfg.secretParam << "[" << cfg.secretPos
        << "] swept over " << NS << " value(s) x every public background p "
        << "(symbolic) -- "
        << (cfg.hasEph()
                ? "eph: s1 ineffective & s2 effective for every r"
                : "per-p pair (forall p exists s1,s2)")
        << "\n";
    if (identical)
      rep << "[!] faulty trace identical to the correct trace\n";
    rep << B.summary();

    vector<int> leaks, unknowns;
    size_t neverAffected = 0;
    for (uint64_t pos = 0; pos < P; pos++) {
      const PosResult &R = results[oi][pos];
      if (R.alwaysIneff.size() == NS)
        neverAffected++;
      bool leak =
          R.v == Verdict::LeakUniform || R.v == Verdict::LeakPDependent;
      if (leak)
        leaks.push_back((int)pos);
      if (R.v == Verdict::Unknown)
        unknowns.push_back((int)pos);
      if (!leak && !S.opts.verbose)
        continue;
      rep << string(75, '=') << "\n";
      if (R.v == Verdict::LeakUniform) {
        rep << "pos " << pos << ": LEAK (holds for every p"
            << (cfg.hasEph() ? " and r" : "") << ")\n"
            << "    s1 ineffective for all p: " << join_vals(R.alwaysIneff, 10)
            << "\n"
            << "    s2 effective   for all p: " << join_vals(R.alwaysEff, 10)
            << "\n";
      } else if (R.v == Verdict::LeakPDependent) {
        rep << "pos " << pos
            << ": LEAK (for every p some s1 is ineffective and some s2 "
               "effective; the pair depends on p)\n";
      } else if (R.v == Verdict::NoLeak) {
        rep << "pos " << pos << ": no leak -- " << R.reason << "\n";
      } else {
        rep << "pos " << pos << ": UNKNOWN (solver timeout)\n";
      }
      rep << string(75, '=') << "\n";
    }
    rep << "[summary] leak at " << leaks.size() << "/" << P
        << " position(s): " << join_vals(leaks, 40) << "\n";
    if (!unknowns.empty())
      rep << "[summary] UNKNOWN (timeout) at " << unknowns.size()
          << " position(s): " << join_vals(unknowns, 40)
          << " -- raise --timeout / --fault-timeout\n";
    if (neverAffected == P)
      rep << "[summary] the fault never changes '" << o.param
          << "' at the analysed positions, for any input\n";

    // Same verdict wording as early_stop_sweep_unicorn.py.
    string line;
    if (!leaks.empty()) {
      const PosResult &R = results[oi][leaks[0]];
      line = "[RESULT] ineffective test: DETECTED at pos " +
             to_string(leaks[0]) +
             (R.v == Verdict::LeakUniform
                  ? " (s1=" + to_string(R.alwaysIneff[0]) +
                        " ineffective, s2=" + to_string(R.alwaysEff[0]) +
                        " effective, for every p" +
                        (cfg.hasEph() ? " and r)" : ")")
                  : string(" (for every p some s1 ineffective and some s2 "
                           "effective)"));
    } else if (!unknowns.empty()) {
      line = "[RESULT] ineffective test: UNKNOWN (no leak proven at " +
             to_string(P - unknowns.size()) + "/" + to_string(P) +
             " positions, timeouts at the rest)";
    } else {
      line = "[RESULT] ineffective test: not detected (proven: no leak at "
             "any of " +
             to_string(P) + " position(s))";
    }
    if (S.outputs().size() > 1)
      line += " [output " + o.param + "]";
    rep << line << "\n";
    if (resultLine.empty() || line.find("DETECTED") != string::npos)
      resultLine = line;

    cout << rep.str();
    string out = result_path(S, J, o, "ineffective_smt_result.txt");
    std::ofstream(out) << rep.str();
    cout << "[+] written " << out << " (" << elapsed() << " s)\n";
  }
  return resultLine;
}

} // namespace

int main(int argc, char **argv) {
  try {
    Options opts = parse_options(argc, argv);
    FunctionSetup S = load_function(opts);
    int failures = 0;
    vector<pair<string, string>> summary;
    for (auto &p : S.faultyPaths) {
      string stem = fs::relative(p, S.fnDir).string();
      stem = stem.substr(0, stem.size() - 5);
      try {
        summary.push_back({stem, run_fault(S, p)});
      } catch (const z3::exception &e) {
        cerr << "[!] " << p << ": z3: " << e.msg() << "\n";
        summary.push_back({stem, "[RESULT] ineffective test: ERROR"});
        failures++;
      } catch (const std::exception &e) {
        cerr << "[!] " << p << ": " << e.what() << "\n";
        summary.push_back({stem, "[RESULT] ineffective test: ERROR"});
        failures++;
      }
    }
    cout << "\n=== ineffective SMT query complete: " << opts.fn << " ("
         << S.faultyPaths.size() << " fault(s), " << failures
         << " failed) ===\n";
    for (auto &kv : summary)
      cout << "  " << kv.first << ": " << kv.second << "\n";
    return failures ? 1 : 0;
  } catch (const z3::exception &e) {
    cerr << "[!] z3: " << e.msg() << "\n";
  } catch (const std::exception &e) {
    cerr << "[!] " << e.what() << "\n";
  }
  return 1;
}
