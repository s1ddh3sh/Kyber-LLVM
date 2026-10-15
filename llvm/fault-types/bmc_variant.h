#pragma once
// The .ll written to tests_kyber/ is also compiled into the simulation's ELF
// (test_qemu/kyber_build.sh), whose Unicorn runner feeds every scalar
// argument through its __mbc_arg_<fn>_<param> anchor global -- so it must
// keep the driver's volatile anchor loads. For llvmbmc, though, such a load
// of a never-written global is folded to its initializer
// (--fold-readonly-globals) and the whole trace becomes constant.
// bmcInputFor() therefore writes a temporary copy for llvmbmc only, in which
// every anchor of a scalar the simulation randomizes (anything not in
// kyber.json's fixed-scalars, the secret included) is read via
// __VERIFIER_nondet_iN() instead: llvmbmc models that as a fresh
// bv_<N>_nondet; the value is also stored back to the anchor so the SMT
// queries can map each nondet to its parameter. (A defined helper would not
// work: llvmbmc force-inlines every function with a body.)

#include "json_parser.h"

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <cstdlib>
#include <filesystem>
#include <iostream>
#include <string>
#include <vector>

// Returns the file llvmbmc should read in place of llPath.
inline std::string bmcInputFor(const std::string &llPath,
                               const std::string &funcName) {
  using namespace llvm;
  KyberFuncConfig cfg = loadKyberFuncConfig(funcName);
  if (!cfg.found) {
    errs() << "  [bmc] " << funcName
           << " not in kyber.json ($KYBER_JSON or "
              "../../../../test_qemu/kyber.json): "
              "scalar arguments stay folded to their initializers\n";
    return llPath;
  }
  LLVMContext ctx;
  SMDiagnostic diag;
  std::unique_ptr<Module> M = parseIRFile(llPath, diag, ctx);
  if (!M) {
    errs() << "  [bmc] warning: could not re-read " << llPath
           << "; running llvmbmc on it unchanged\n";
    return llPath;
  }

  const std::string prefix = "__mbc_arg_" + funcName + "_";
  bool changed = false;
  for (GlobalVariable &G : M->globals()) {
    if (!G.getName().starts_with(prefix) || !G.getValueType()->isIntegerTy())
      continue;
    std::string param = G.getName().substr(prefix.size()).str();
    if (cfg.fixedScalars.count(param))
      continue;
    Type *ty = G.getValueType();
    std::string ndName =
        "__VERIFIER_nondet_i" + std::to_string(ty->getIntegerBitWidth());
    FunctionCallee nd = M->getOrInsertFunction(ndName, ty);
    std::vector<LoadInst *> loads;
    for (User *U : G.users())
      if (auto *L = dyn_cast<LoadInst>(U))
        loads.push_back(L);
    for (LoadInst *L : loads) {
      IRBuilder<> b(L);
      CallInst *c = b.CreateCall(nd, {}, L->getName());
      // Writing the value back to the anchor leaves an explicit
      // (= bv_<M>___mbc_arg_<fn>_<param>_<sfx> bv_<K>_nondet) in the trace,
      // so the queries can tell which nondet is which parameter even when a
      // fault makes some of them unused (llvmbmc only declares used symbols).
      b.CreateStore(c, &G, /*isVolatile=*/true);
      L->replaceAllUsesWith(c);
      L->eraseFromParent();
      changed = true;
    }
    if (!loads.empty())
      errs() << "  [bmc] scalar '" << param << "' left symbolic for llvmbmc ("
             << ndName << "), not in fixed-scalars\n";
  }
  if (!changed)
    return llPath;

  std::string out =
      (std::filesystem::temp_directory_path() /
       (std::filesystem::path(llPath).stem().string() + ".bmc.ll"))
          .string();
  std::error_code ec;
  raw_fd_ostream os(out, ec, sys::fs::OF_Text);
  if (ec) {
    errs() << "  [bmc] warning: cannot write " << out << ": " << ec.message()
           << "; running llvmbmc on " << llPath << " unchanged\n";
    return llPath;
  }
  M->print(os, nullptr);
  return out;
}

// llvmbmc runs (one per trace) whose .smt2 could not be produced.
inline std::vector<std::string> &bmcFailures() {
  static std::vector<std::string> failures;
  return failures;
}

// Runs one llvmbmc command (it writes /tmp/test.smt2) and copies the trace to
// smt2Out. A failure (e.g. an llvmbmc assertion) only skips this trace: any
// stale smt2Out from an earlier run is removed so the queries cannot pick it
// up, a "BMC_FAILED: <label> -> <smt2Out>" line is printed for run_faults.sh,
// and false is returned.
inline bool runBmcToSmt2(const std::string &cmd, const std::string &smt2Out,
                         const std::string &label) {
  const std::string tmpSmt2 = "/tmp/test.smt2";
  std::error_code ec;
  std::filesystem::remove(tmpSmt2, ec);
  bool ok = std::system(cmd.c_str()) == 0 && std::filesystem::exists(tmpSmt2);
  if (ok)
    ok = std::system(("cp " + tmpSmt2 + " " + smt2Out).c_str()) == 0;
  if (!ok) {
    std::filesystem::remove(smt2Out, ec);
    std::cerr << "BMC_FAILED: " << label << " -> " << smt2Out << "\n";
    bmcFailures().push_back(label + " -> " + smt2Out);
  }
  return ok;
}

// main()'s exit code: 0 if every trace was produced, 2 if some llvmbmc runs
// failed (the remaining traces were still written).
inline int bmcExitCode() {
  if (bmcFailures().empty())
    return 0;
  std::cerr << bmcFailures().size() << " llvmbmc run(s) failed:\n";
  for (const std::string &f : bmcFailures())
    std::cerr << "  " << f << "\n";
  return 2;
}
