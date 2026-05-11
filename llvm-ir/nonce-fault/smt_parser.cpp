#include "z3++.h"
#include <fstream>
#include <iostream>
#include <regex>
#include <sstream>
#include <string>

using namespace z3;
using namespace std;


string rewrite_to_bv(const string &filename) {
  ifstream ifs(filename);
  if (!ifs) {
    cerr << "Cannot open: " << filename << "\n";
    exit(1);
  }

  string content((istreambuf_iterator<char>(ifs)), istreambuf_iterator<char>());

  {
    istringstream ss(content);
    ostringstream out;
    string line;
    while (getline(ss, line)) {
      string t = line;
      t.erase(0, t.find_first_not_of(" \t"));
      if (t == "(assert and)")
        continue;
      if (t == "(assert (not true))")
        continue;
      if (t == "(check-sat)")
        continue;
      out << line << '\n';
    }
    content = out.str();
  }

  {
    size_t pos = 0;
    const string from = "(Array Int Int)";
    const string to = "(Array (_ BitVec 32) (_ BitVec 8))";
    while ((pos = content.find(from, pos)) != string::npos) {
      content.replace(pos, from.size(), to);
      pos += to.size();
    }
  }

  //int to bitvec
  for (const string &var : {"i_6_a_correct", "i_6_a_faulty", "i_7_b_correct",
                            "i_7_b_faulty", "i_8_c_correct", "i_8_c_faulty"}) {
    string from = "(declare-fun " + var + " () Int)";
    string to = "(declare-fun " + var + " () (_ BitVec 32))";
    size_t pos = content.find(from);
    if (pos != string::npos)
      content.replace(pos, from.size(), to);
  }

  //Replace the XOR let-block with pure bvxor
  // Original pattern:
  //   (let ((a!1 (bvslt (bvxor ((_ int2bv 8) (select MEM IDX_A))
  //                            ((_ int2bv 8) (select MEM IDX_B)))
  //                     #x00))
  //         (a!2 (bv2int (bvxor ((_ int2bv 8) (select MEM IDX_A))
  //                             ((_ int2bv 8) (select MEM IDX_B))))))
  //     (= C_NEW (store MEM IDX_C (ite a!1 (- a!2 256) a!2))))
  //
  // Replacement :
  //   (= C_NEW (store MEM IDX_C (bvxor (select MEM IDX_A)
  //                                    (select MEM IDX_B))))
  {
    
    regex pat(
        R"(\(let \(\(a!1 \(bvslt \(bvxor \(\(_ int2bv 8\)\s*)"
        R"(\(select (\S+) (\S+)\)\)\s*)"                    // MEM, IDX_A
        R"(\(\(_ int2bv 8\)\s*\(select \S+ (\S+)\)\)\)\s*)" // IDX_B
        R"(#x00\)\)\s*)"
        R"(\(a!2 \(bv2int \(bvxor \(\(_ int2bv 8\)\s*)"
        R"(\(select \S+ \S+\)\)\s*)"
        R"(\(\(_ int2bv 8\)\s*\(select \S+ \S+\)\)\)\)\)\s*)"
        R"(\(= (\S+)\s*)"                                            // C_NEW
        R"(\(store (\S+) (\S+) \(ite a!1 \(- a!2 256\) a!2\)\)\)\))" // MEM2,
                                                                     // IDX_C
    );

    string result;
    auto it = content.cbegin();
    auto end = content.cend();
    smatch m;

    while (regex_search(it, end, m, pat)) {
      result += m.prefix().str();
      string mem = m[1];   
      string idx_a = m[2]; 
      string idx_b = m[3]; 
      string c_new = m[4]; 
      string mem2 = m[5];  
      string idx_c = m[6]; 

      result += "(= " + c_new + " (store " + mem2 + " " + idx_c +
                " (bvxor (select " + mem + " " + idx_a +
                ")"
                " (select " +
                mem + " " + idx_b + "))))";

      it = m.suffix().first;
    }
    result += string(it, end);
    content = result;
  }

//remove any bvint and intbv
  {
    regex bv2int_pat(R"(\(bv2int (\([^)]+\))\))");
    content = regex_replace(content, bv2int_pat, "$1");

    regex int2bv_pat(R"(\(\(_ int2bv 8\) ([^)]+)\))");
    content = regex_replace(content, int2bv_pat, "$1");
  }

  return content;
}

string write_temp(const string &content, const string &suffix) {
  string path = "/tmp/z3_bv_" + suffix + ".smt2";
  ofstream ofs(path);
  ofs << content;
  return path;
}

int main(int argc, char *argv[]) {
  string correct_file = (argc > 1) ? argv[1] : "../correct.smt2";
  string faulty_file = (argc > 2) ? argv[2] : "../funcSkip.smt2";

  cout << "Rewriting to pure bitvector theory...\n";
  string correct_tmp = write_temp(rewrite_to_bv(correct_file), "correct");
  string faulty_tmp = write_temp(rewrite_to_bv(faulty_file), "faulty");

  cout << "Written to " << correct_tmp << " and " << faulty_tmp << "\n";
  cout << "Inspect these files if Z3 fails to parse.\n\n";

  context ctx;
  solver s(ctx);

  expr_vector correct_exprs = ctx.parse_file(correct_tmp.c_str());
  expr_vector faulty_exprs = ctx.parse_file(faulty_tmp.c_str());

  for (expr e : correct_exprs)
    s.add(e);
  for (expr e : faulty_exprs)
    s.add(e);

  cout << "Loaded " << correct_exprs.size() << " correct + "
       << faulty_exprs.size() << " faulty assertions\n";

  z3::sort bv32 = ctx.bv_sort(32);
  z3::sort bv8 = ctx.bv_sort(8);
  z3::sort arr = ctx.array_sort(bv32, bv8);

  // Force all path booleans true (235 of them)
  for (int i = 1; i <= 235; i++) {
    string name = "b_" + to_string(i) + "_path";
    s.add(ctx.bool_const(name.c_str()));
  }
  cout << "Forced 235 path booleans true\n";

  // Same inputs
  s.add(ctx.constant("i_6_a_correct", bv32) ==
        ctx.constant("i_6_a_faulty", bv32));
  s.add(ctx.constant("i_7_b_correct", bv32) ==
        ctx.constant("i_7_b_faulty", bv32));
  s.add(ctx.constant("i_8_c_correct", bv32) ==
        ctx.constant("i_8_c_faulty", bv32));
  s.add(ctx.constant("c_1_Global_M_correct", arr) ==
        ctx.constant("c_1_Global_M_faulty", arr));

  // Output differs
  s.add(ctx.constant("c_314_Global_M_correct", arr) !=
        ctx.constant("c_314_Global_M_faulty", arr));

  cout << "Running Z3...\n";

  check_result result = s.check();

  if (result == sat) {
    cout << "Result: SAT, fault IS observable\n\n";
    model m = s.get_model();

    z3::expr a = ctx.constant("i_6_a_correct", bv32);
    z3::expr b = ctx.constant("i_7_b_correct", bv32);
    z3::expr c = ctx.constant("i_8_c_correct", bv32);
    z3::expr mem = ctx.constant("c_1_Global_M_correct", arr);

    auto ev = [&](expr e) { return m.eval(e, true); };

    cout << "  i_6_a  = " << ev(a) << "\n";
    cout << "  i_7_b  = " << ev(b) << "\n";
    cout << "  i_8_c  = " << ev(c) << "\n";
    cout << "  M[a]   = " << ev(select(mem, a)) << "\n";
    cout << "  M[b]   = " << ev(select(mem, b)) << "\n";
    cout << "  Correct: c[i_8_c] = M[a] bvxor M[b]\n";
    cout << "  Faulty:  c[i_8_c] = M[a]  (b skipped)\n";

  } else if (result == unsat) {
    cout << "Result: UNSAT, fault masked for all inputs\n";
  } else {
    cout << "Result: UNKNOWN " << s.reason_unknown() << "\n";
  }

  return 0;
}