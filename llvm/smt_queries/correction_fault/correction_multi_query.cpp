// correction_multi_query.cpp -- SMT version of the correction test of
// test_qemu/dist_tests/kyber/early_stop_sweep_unicorn.py for one Kyber
// function.
//
//   ./correction_query <func_name> [options]       (see kyber_smt.h usage)
//
// Parameters come from kyber.json / qemu_witness.json / active_lengths.json
// exactly as in run_combined_unicorn.sh. With s = secret_buf[secret_pos]
// swept over domain_values(), p = every other input (eph_secret buffers
// included -- the simulation redraws them with every public seed, so they
// are part of "for all p" there too), and Delta(s,p) the per-word
// difference of compute_delta() (xor, or (y1 - y2) mod q for an R_q-shaped
// output), the query per output word is
//
//   exists alpha != 0, s :  forall p :  Delta(s, p) = alpha
//
// p is symbolic, so "forall p" is exact rather than the simulation's
// handful of seeds. Per s (one thread each): take any model to read off the
// only possible alpha = Delta(s, p0) at every position, then prove it
// constant by checking  exists p : Delta(s,p) != alpha  is UNSAT -- batched
// over all candidate positions, so each SAT model rules out every position
// it moves and one UNSAT answer confirms all remaining ones.
#include "kyber_smt.h"

using namespace kyber_smt;
using std::cerr;
using std::cout;

namespace {

enum class Corr : int8_t { Witness, NotConstant, AlphaZero, Unknown };

struct CorrCell {
  Corr c = Corr::Unknown;
  uint64_t alpha = 0;
};

// cells[out][pos] for secret value index si
void correction_for_secret(const FunctionSetup &S, const FaultJob &J,
                           Budget &B, size_t si,
                           vector<vector<CorrCell>> &cells) {
  long s = S.cfg.secretValues[si];
  Instance I(S.cfg, B);
  I.add_trace(S.correct, "C");
  I.add_trace(J.trace, "F");
  I.bind_inputs(S.correct, "C", s);
  I.bind_inputs(J.trace, "F", s);

  vector<vector<z3::expr>> delta(S.outputs().size());
  for (size_t oi = 0; oi < S.outputs().size(); oi++) {
    cells[oi].assign(num_positions(S, S.outputs()[oi]), CorrCell{});
    for (uint64_t pos = 0; pos < cells[oi].size(); pos++)
      delta[oi].push_back(
          I.delta(S.correct, "C", J.trace, "F", S.outputs()[oi], pos));
  }

  z3::check_result r = I.check();
  if (r == z3::unsat)
    throw runtime_error("s=" + to_string(s) +
                        ": the trace is UNSAT for every input -- the trace "
                        "itself (or the input rewriting) is inconsistent");
  if (r != z3::sat)
    return; // all Unknown
  z3::model m0 = I.slv.get_model();

  vector<pair<size_t, size_t>> cand;
  for (size_t oi = 0; oi < delta.size(); oi++)
    for (size_t pos = 0; pos < delta[oi].size(); pos++) {
      CorrCell &c = cells[oi][pos];
      c.alpha = Instance::eval_u(m0, delta[oi][pos]);
      if (c.alpha == 0)
        c.c = Corr::AlphaZero; // alpha would have to be this value
      else
        cand.push_back({oi, pos});
    }
  auto differs = [&](size_t oi, size_t pos) {
    const OutputBuf &o = S.outputs()[oi];
    return delta[oi][pos] !=
           I.ctx.bv_val(cells[oi][pos].alpha, Instance::delta_bits(o));
  };

  while (!cand.empty()) {
    z3::expr_vector any(I.ctx);
    for (auto &k : cand)
      any.push_back(differs(k.first, k.second));
    I.slv.push();
    I.slv.add(z3::mk_or(any));
    z3::check_result rr = I.check();
    vector<pair<size_t, size_t>> keep;
    if (rr == z3::sat) {
      z3::model m = I.slv.get_model();
      for (auto &k : cand) {
        CorrCell &c = cells[k.first][k.second];
        if (Instance::eval_u(m, delta[k.first][k.second]) != c.alpha)
          c.c = Corr::NotConstant;
        else
          keep.push_back(k);
      }
    }
    I.slv.pop();
    if (rr == z3::unsat) {
      for (auto &k : cand)
        cells[k.first][k.second].c = Corr::Witness;
      break;
    }
    if (rr == z3::sat && keep.size() < cand.size()) {
      cand.swap(keep);
      continue;
    }
    // Timeout (or no progress): one check per remaining position.
    for (auto &k : cand) {
      I.slv.push();
      I.slv.add(differs(k.first, k.second));
      z3::check_result r1 = I.check();
      I.slv.pop();
      cells[k.first][k.second].c = r1 == z3::unsat ? Corr::Witness
                                   : r1 == z3::sat ? Corr::NotConstant
                                                   : Corr::Unknown;
    }
    break;
  }
}

// alpha as the simulation prints it: the mod-sub value, or the xor of the
// decoded (signed for 2/4-byte words) values.
long long alpha_value(const OutputBuf &o, uint64_t a) {
  if (o.modSub)
    return (long long)a;
  return Instance::signed_val(a, 8 * o.wordSize, o.wordSize > 1);
}

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

  // cells[s index][out][pos]
  vector<vector<vector<CorrCell>>> cells(
      NS, vector<vector<CorrCell>>(S.outputs().size()));
  cout << "[i] " << NS << " secret values, " << S.opts.jobs << " job(s)\n"
       << std::flush;
  unsigned jobs = mem_safe_jobs(
      S.opts.jobs, S.correct.text.size() + J.trace.text.size(), "correction");
  parallel_for(NS, jobs, [&](size_t si) {
    correction_for_secret(S, J, B, si, cells[si]);
  });
  double secs =
      std::chrono::duration<double>(std::chrono::steady_clock::now() - t0)
          .count();

  string resultLine;
  for (size_t oi = 0; oi < S.outputs().size(); oi++) {
    const OutputBuf &o = S.outputs()[oi];
    uint64_t P = num_positions(S, o);
    string rel = o.modSub ? "(y1 - y2) mod " + to_string(cfg.modulus) +
                                " = alpha"
                          : "y1 = y2 xor alpha";
    std::ostringstream rep;
    rep << "[i] SMT correction query: " << J.stem << ", output '" << o.param
        << "' (" << P << " word(s) of " << o.wordSize << " byte(s))\n"
        << "[i] " << NS << " secret value(s) of " << cfg.secretParam << "["
        << cfg.secretPos << "] x every public background p (symbolic"
        << (cfg.hasEph() ? ", eph_secret included in p" : "") << ")\n";
    if (identical)
      rep << "[!] faulty trace identical to the correct trace\n";
    rep << B.summary();

    vector<int> witnessPos, unknownPos;
    pair<long, long long> firstWitness{0, 0};
    for (uint64_t pos = 0; pos < P; pos++) {
      vector<pair<long, long long>> w;
      bool unk = false;
      for (size_t si = 0; si < NS; si++) {
        const CorrCell &c = cells[si][oi][pos];
        if (c.c == Corr::Witness)
          w.push_back({cfg.secretValues[si], alpha_value(o, c.alpha)});
        unk |= c.c == Corr::Unknown;
      }
      if (!w.empty()) {
        if (witnessPos.empty())
          firstWitness = w[0];
        witnessPos.push_back((int)pos);
      }
      if (unk)
        unknownPos.push_back((int)pos);
      if (w.empty() && !S.opts.verbose)
        continue;
      rep << string(75, '=') << "\n"
          << "pos " << pos << ": " << w.size() << "/" << NS
          << " secret values with " << rel << " (alpha != 0) for all p"
          << (unk ? "  [some s UNKNOWN]" : "") << "\n";
      for (size_t k = 0; k < w.size() && k < 10; k++)
        rep << "    s=" << w[k].first << ", alpha=" << w[k].second << "\n";
      if (w.size() > 10)
        rep << "    ... and " << w.size() - 10 << " more\n";
      rep << string(75, '=') << "\n";
    }
    rep << "[summary] correction witness at " << witnessPos.size() << "/" << P
        << " position(s): " << join_vals(witnessPos, 40) << "\n";
    if (!unknownPos.empty())
      rep << "[summary] UNKNOWN (timeout) for some s at " << unknownPos.size()
          << " position(s): " << join_vals(unknownPos, 40)
          << " -- raise --timeout / --fault-timeout\n";

    // Same verdict wording as early_stop_sweep_unicorn.py.
    string line;
    if (!witnessPos.empty())
      line = "[RESULT] correction test: SATISFIED at pos " +
             to_string(witnessPos[0]) + " (s=" +
             to_string(firstWitness.first) +
             ", alpha=" + to_string(firstWitness.second) + ": " + rel +
             " for every p)";
    else if (!unknownPos.empty())
      line = "[RESULT] correction test: UNKNOWN (no witness; timeouts at " +
             to_string(unknownPos.size()) + " position(s))";
    else
      line = "[RESULT] correction test: not satisfied (proven: no (s, alpha) "
             "with constant Delta at any of " +
             to_string(P) + " position(s))";
    if (S.outputs().size() > 1)
      line += " [output " + o.param + "]";
    rep << line << "\n";
    if (resultLine.empty() || line.find("SATISFIED") != string::npos)
      resultLine = line;

    cout << rep.str();
    string out = result_path(S, J, o, "correction_smt_result.txt");
    std::ofstream(out) << rep.str();
    cout << "[+] written " << out << " (" << secs << " s)\n";
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
        summary.push_back({stem, "[RESULT] correction test: ERROR"});
        failures++;
      } catch (const std::exception &e) {
        cerr << "[!] " << p << ": " << e.what() << "\n";
        summary.push_back({stem, "[RESULT] correction test: ERROR"});
        failures++;
      }
    }
    cout << "\n=== correction SMT query complete: " << opts.fn << " ("
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
