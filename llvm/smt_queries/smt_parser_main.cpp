#include "z3++.h"
#include <fstream>
#include <iostream>
#include <iterator>
#include <regex>
#include <stdexcept>
#include <string>
#include <vector>

using namespace z3;
using namespace std;

string strip_boilerplate(const string &src) {
  istringstream ss(src);
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
  return out.str();
}

string rewrite_to_bv(const string &filename) {
  ifstream ifs(filename);
  if (!ifs) {
    cerr << "Cannot open: " << filename << "\n";
    exit(1);
  }
  string content((istreambuf_iterator<char>(ifs)), istreambuf_iterator<char>());

  // 1. strip boilerplate
  content = strip_boilerplate(content);
  return content;
}
string write_suffixed(const string &content, const string &tag) {
  string result = content;
  regex ident(R"(\b((?:i|c|b)_\d+_[A-Za-z0-9_.]+)\b)");
  result = regex_replace(result, ident, "$1_" + tag);

  string path = "../" + tag + ".smt2";
  ofstream ofs(path);
  if (!ofs) {
    cerr << "Cannot write " << path << "\n";
    exit(1);
  }
  ofs << result;
  return path;
}


expr extract_array_def(expr_vector &ev, const string &target_name) {
  for (expr e : ev) {
    if (e.is_app() && e.decl().decl_kind() == Z3_OP_EQ) {
      expr lhs = e.arg(0);
      if (lhs.is_const()) {
        if (lhs.decl().name().str().find(target_name) != string::npos)
          return e;
      }
    }
  }
  throw runtime_error("Definition of '" + target_name + "' not found");
}

expr find_first(expr e, Z3_decl_kind target_kind) {
  if (e.is_app()) {
    if (e.decl().decl_kind() == target_kind)
      return e;
    for (unsigned i = 0; i < e.num_args(); i++) {
      try {
        return find_first(e.arg(i), target_kind);
      } catch (...) {
      }
    }
  }
  throw runtime_error("Node not found: kind " + to_string(target_kind));
}

void collect_all(expr e, Z3_decl_kind target_kind, vector<expr> &out) {
  if (e.is_app()) {
    if (e.decl().decl_kind() == target_kind)
      out.push_back(e);
    for (unsigned i = 0; i < e.num_args(); i++)
      collect_all(e.arg(i), target_kind, out);
  }
}


expr extract_s_byte0_select(expr c16_def) {
  expr c16_array = c16_def.arg(0);
  expr store_node = find_first(c16_def.arg(1), Z3_OP_STORE);
  expr store_index = store_node.arg(1); // (+ 858 i_9_s_X) from file
  return select(c16_array, store_index);
}
// Return the STORE node from the definition.
expr extract_store(expr array_def) {
  return find_first(array_def.arg(1), Z3_OP_STORE);
}

// Previous array being updated.
expr previous_array(expr store_node) { return store_node.arg(0); }

// Index written by this store.
expr store_index(expr store_node) { return store_node.arg(1); }

pair<expr, expr> extract_input_selects(expr c16_def) {
  expr store_node = find_first(c16_def.arg(1), Z3_OP_STORE);
  expr stored_val = store_node.arg(2); // ite/bvop subtree

  vector<expr> selects;
  collect_all(stored_val, Z3_OP_SELECT, selects);

  vector<expr> unique_selects;
  for (expr &sel : selects) {
    bool found = false;
    for (expr &u : unique_selects)
      if (z3::eq(sel, u)) {
        found = true;
        break;
      }
    if (!found)
      unique_selects.push_back(sel);
  }

  if (unique_selects.size() < 2)
    throw runtime_error("Expected 2 distinct select nodes, found " +
                        to_string(unique_selects.size()));

  // unique_selects[0] = select(c_15, +780+Vdec)

  return {unique_selects[0], unique_selects[1]};
}

int main() {
  context ctx;
  solver slv(ctx);
  const char *correct_path = "../correct.smt2";
  const char *faulty_path = "../funcSkip.smt2";

  string correct_bv = rewrite_to_bv(correct_path);
  string faulty_bv = rewrite_to_bv(faulty_path);
  string c_ox1 = write_suffixed(correct_bv, "C1");
  string f_ox1 = write_suffixed(faulty_bv, "F1");
  string c_ox2 = write_suffixed(correct_bv, "C2");
  string f_ox2 = write_suffixed(faulty_bv, "F2");


  expr_vector correct_asserts = ctx.parse_file("../correct.smt2");
  expr_vector faulty_asserts = ctx.parse_file("../funcSkip.smt2");



  expr_vector C1 = ctx.parse_file(c_ox1.c_str());
  expr_vector F1 = ctx.parse_file(f_ox1.c_str());
  expr_vector C2 = ctx.parse_file(c_ox2.c_str());
  expr_vector F2 = ctx.parse_file(f_ox2.c_str());

  for (expr e : C1)
    slv.add(e);
  for (expr e : F1)
    slv.add(e);
  for (expr e : C2)
    slv.add(e);
  for (expr e : F2)
    slv.add(e);

  expr c16_C1 = extract_array_def(C1, "c_16_Global_M_correct_C1");
  expr c16_F1 = extract_array_def(F1, "c_16_Global_M_faulty_F1");

  expr c16_C2 = extract_array_def(C2, "c_16_Global_M_correct_C2");
  expr c16_F2 = extract_array_def(F2, "c_16_Global_M_faulty_F2");



  expr store_C1 = extract_store(c16_C1);
  expr store_F1 = extract_store(c16_F1);

  expr store_C2 = extract_store(c16_C2);
  expr store_F2 = extract_store(c16_F2);

  cout << store_C1 << endl;
  cout << store_F1 << endl;
  cout << store_C2 << endl;
  cout << store_F2 << endl;
  //   expr s_byte0_correct = select(store_c, store_index(store_c));

  //   expr s_byte0_faulty = select(store_f, store_index(store_f));

  expr sC1 = store_C1.arg(2);
  expr sF1 = store_F1.arg(2);

  expr sC2 = store_C2.arg(2);
  expr sF2 = store_F2.arg(2);
  //   expr s_byte0_correct = select(c16_correct_def.arg(0),
  //   store_index(store_c));

  //   expr s_byte0_faulty = select(c16_faulty_def.arg(0),
  //   store_index(store_f));

  // expr s_byte0_correct = extract_s_byte0_select(c16_correct_def);
  // expr s_byte0_faulty  = extract_s_byte0_select(c16_faulty_def);

  //   cout << s_byte0_correct << s_byte0_faulty;

  expr prev_C1 = previous_array(store_C1);
  expr prev_F1 = previous_array(store_F1);

  expr prev_C2 = previous_array(store_C2);
  expr prev_F2 = previous_array(store_F2);
  // Recover the Vdec and Ox indices from the store index.
  // store index = (+ 858 i_9_s)
  // Therefore byte index = store_index - 858.

  expr vAddrC1 = ctx.int_val(780) + ctx.int_const("i_2_Vdec_correct_C1");

  expr vAddrF1 = ctx.int_val(780) + ctx.int_const("i_2_Vdec_faulty_F1");

  expr vAddrC2 = ctx.int_val(780) + ctx.int_const("i_2_Vdec_correct_C2");

  expr vAddrF2 = ctx.int_val(780) + ctx.int_const("i_2_Vdec_faulty_F2");

  expr oxAddrC1 = ctx.int_val(780) + ctx.int_const("i_4_Ox_correct_C1");

  expr oxAddrF1 = ctx.int_val(780) + ctx.int_const("i_4_Ox_faulty_F1");

  expr oxAddrC2 = ctx.int_val(780) + ctx.int_const("i_4_Ox_correct_C2");

  expr oxAddrF2 = ctx.int_val(780) + ctx.int_const("i_4_Ox_faulty_F2");

  expr vC1 = select(prev_C1, vAddrC1);
  expr vF1 = select(prev_F1, vAddrF1);

  expr vC2 = select(prev_C2, vAddrC2);
  expr vF2 = select(prev_F2, vAddrF2);

  expr oxC1 = select(prev_C1, oxAddrC1);
  expr oxF1 = select(prev_F1, oxAddrF1);

  expr oxC2 = select(prev_C2, oxAddrC2);
  expr oxF2 = select(prev_F2, oxAddrF2);

  z3::sort arr = ctx.array_sort(ctx.int_sort(), ctx.int_sort());

  expr M1 = ctx.constant("c_1_Global_M_correct_C1", arr);

  slv.add(M1 == ctx.constant("c_1_Global_M_faulty_F1", arr));

  slv.add(M1 == ctx.constant("c_1_Global_M_correct_C2", arr));

  slv.add(M1 == ctx.constant("c_1_Global_M_faulty_F2", arr));

  expr v = ctx.int_const("sharedV");

  slv.add(v >= 0);
  slv.add(v < 78);

  slv.add(ctx.int_const("i_2_Vdec_correct_C1") == v);
  slv.add(ctx.int_const("i_2_Vdec_faulty_F1") == v);
  slv.add(ctx.int_const("i_2_Vdec_correct_C2") == v);
  slv.add(ctx.int_const("i_2_Vdec_faulty_F2") == v);

  expr sidx = ctx.int_const("sharedS");

  slv.add(sidx >= 0);
  slv.add(sidx < 78);

  slv.add(ctx.int_const("i_9_s_correct_C1") == sidx);
  slv.add(ctx.int_const("i_9_s_faulty_F1") == sidx);
  slv.add(ctx.int_const("i_9_s_correct_C2") == sidx);
  slv.add(ctx.int_const("i_9_s_faulty_F2") == sidx);

  expr ox1 = ctx.int_const("sharedOx1");

  expr ox2 = ctx.int_const("sharedOx2");

  slv.add(ox1 >= 0);
  slv.add(ox1 < 78);

  slv.add(ox2 >= 0);
  slv.add(ox2 < 78);

  slv.add(ctx.int_const("i_4_Ox_correct_C1") == ox1);
  slv.add(ctx.int_const("i_4_Ox_faulty_F1") == ox1);

  slv.add(ctx.int_const("i_4_Ox_correct_C2") == ox2);
  slv.add(ctx.int_const("i_4_Ox_faulty_F2") == ox2);

  slv.add(ox1 != ox2);

  // Same input
  slv.add(vC1 == vF1);
  slv.add(vC1 == vC2);
  slv.add(vC2 == vF2);

  slv.add(oxC1 == oxF1);
  slv.add(oxC2 == oxF2);

  slv.add(sC1 == sF1);

  slv.add(sC2 != sF2);

  //   expr sel_vdec_c = select(prev_c, vdec_addr);
  //   expr sel_ox_c = select(prev_c, ox_addr);

  //   expr sel_vdec_f = select(prev_f, vdec_addr_f);
  //   expr sel_ox_f = select(prev_f, ox_addr_f);

  // Constrain same inputs.
  //   slv.add(sel_vdec_c == sel_vdec_f);
  //   slv.add(sel_ox_c == sel_ox_f);

  //   expr vdec_idx_c = ctx.int_const("i_2_Vdec_correct");
  //   expr vdec_idx_f = ctx.int_const("i_2_Vdec_faulty");

  //   expr ox_idx_c = ctx.int_const("i_4_Ox_correct");
  //   expr ox_idx_f = ctx.int_const("i_4_Ox_faulty");

  //   expr s_idx_c = ctx.int_const("i_9_s_correct");
  //   expr s_idx_f = ctx.int_const("i_9_s_faulty");
  //   slv.add(vdec_idx_c >= 0);
  //   slv.add(vdec_idx_c < 78);

  //   slv.add(vdec_idx_f >= 0);
  //   slv.add(vdec_idx_f < 78);

  //   slv.add(ox_idx_c >= 0);
  //   slv.add(ox_idx_c < 78);

  //   slv.add(ox_idx_f >= 0);
  //   slv.add(ox_idx_f < 78);

  //   slv.add(s_idx_c >= 0);
  //   slv.add(s_idx_c < 78);

  //   slv.add(s_idx_f >= 0);
  //   slv.add(s_idx_f < 78);
  //   slv.add(vdec_idx_c == vdec_idx_f);
  //   slv.add(ox_idx_c == ox_idx_f);

  //   // Observe fault
  //   slv.add(s_byte0_correct != s_byte0_faulty);

  //   cout << "STORE:\n" << store_c << "\n\n";
  //   cout << "STORE VALUE:\n" << store_c.arg(2) << "\n\n";
  //   cout << "S BYTE:\n" << s_byte0_correct << "\n";
  //   cout << (select(store_c, store_index(store_c))).simplify() << endl;
  //   cout << (select(store_f, store_index(store_f))).simplify() << endl;

  switch (slv.check()) {

  case sat: {
    cout << "SAT — found ineffective/effective Ox pair\n\n";

    model m = slv.get_model();
    auto ev = [&](expr e) { return (m.eval(e, true)).simplify(); };
    expr stored = store_C2.arg(2);

    // vector<expr> selects;
    // collect_all(store_C2.arg(2), Z3_OP_SELECT, selects);

    // expr vdec = selects[0];
    // expr ox = selects[1];

    // cout << "Vdec = " << ev(vdec) << '\n';
    // cout << "Ox   = " << ev(ox) << '\n';

    // cout << "BV Vdec = " << ev(int2bv(8, vdec)) << '\n';
    // cout << "BV Ox   = " << ev(int2bv(8, ox)) << '\n';

    // expr xor_node = find_first(store_C2.arg(2), Z3_OP_BXOR);
    // cout << "XOR = " << xor_node << '\n';

    //     cout << ev(ctx.constant("c_15_Global_M_correct_C1", arr)) << endl;
    // cout << ev(ctx.constant("c_15_Global_M_correct_C2", arr)) << endl;

    // for (unsigned i = 0; i < selects.size(); i++) {
    //   cout << "select[" << i << "] = " << selects[i] << "\n";
    //   cout << "value      = " << ev(selects[i]) << "\n";
    //   cout << "bv value   = " << ev(int2bv(8, selects[i])) << "\n\n";
    // }

    cout << "Shared indices\n";

    cout << "Vdec index = " << ev(v) << "\n";
    cout << "Ox1  index = " << ev(ox1)
         << "  (addr = " << ev(ctx.int_val(780) + ox1) << ")\n";
    cout << "Ox2  index = " << ev(ox2)
         << "  (addr = " << ev(ctx.int_val(780) + ox2) << ")\n";
    cout << "s    index = " << ev(sidx)
         << "  (addr = " << ev(ctx.int_val(858) + sidx) << ")\n\n";
    cout << "------------------------------\n";

    cout << "Input bytes\n";

    cout << "Vdec = " << ev(vC1) << "  (BV = " << ev(int2bv(8, vC1)) << ")\n";

    cout << "Ox1  = " << ev(oxC1) << "  (BV = " << ev(int2bv(8, oxC1)) << ")\n";

    cout << "Ox2  = " << ev(oxC2) << "  (BV = " << ev(int2bv(8, oxC2))
         << ")\n\n";
    cout << "------------------------------\n";

    cout << "Execution 1 (ineffective fault)\n";

    cout << "Correct output = " << ev(sC1) << "\n";
    cout << "Faulty  output = " << ev(sF1) << "\n";

    cout << "Correct XOR (BV8) = " << ev(int2bv(8, vC1) ^ int2bv(8, oxC1))
         << "\n\n";
    cout << "------------------------------\n";

    cout << "Execution 2 (effective fault)\n";

    cout << "Correct output = " << ev(sC2) << "\n";
    cout << "Faulty  output = " << ev(sF2) << "\n";

    cout << "Correct XOR (BV8) = " << ev(int2bv(8, vC2) ^ int2bv(8, oxC2))
         << "\n";

    break;
  }
  case unsat:
    cout << "UNSAT \n";
    break;
  case unknown:
    cout << "UNKNOWN\n";
    break;
  }

  return 0;
}