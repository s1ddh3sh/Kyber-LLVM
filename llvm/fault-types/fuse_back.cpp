//===- fuse_back.cpp (occurrence-gated) ---------------------------------===//
//
// Take the full-Kyber base module and a single faulted variant of one
// function, and emit a whole-program module in which:
//
//   * the faulted body is imported under the name  <funcName>__faulted
//     (the original <funcName> is KEPT intact),
//   * every call site of <funcName> is replaced by a runtime gate that
//     dispatches the TARGET dynamic occurrence to <funcName>__faulted and
//     every other occurrence to the original.
//
// The faulted variant already bakes in exactly one fault on its first internal
// iteration, so the only selection left is which dynamic CALL occurrence to
// fault -- that is the counter gate. Default target occurrence = 1.
//
// This models a single transient fault: a function called N times (e.g.
// keccak_absorb_once, once per nonce) is faulted on exactly ONE invocation,
// not permanently on all of them.
//
// Fusing the unmodified tests_kyber/<func>/<func>.ll yields the CORRECT gated
// build (the faulted clone is identical to the original, so the gate is a
// no-op). Output goes under tests_kyber/<func>/**/full_kyber/.
//
// Usage:
//   ./fuse_back <base.ll> <function.ll> <functionName> [targetOccurrence]
//
// Run once per faulted variant file.
//===----------------------------------------------------------------------===//

#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/Alignment.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <cctype>
#include <iostream>
#include <memory>
#include <set>
#include <string>
#include <vector>

using namespace llvm;

static GlobalValue *
resolveOrImportGlobal(GlobalValue *GV, Module &DestM,
                      DenseMap<GlobalValue *, GlobalValue *> &Imported);

static Function *
importFunction(Function *SrcFn, Module &DestM,
               DenseMap<GlobalValue *, GlobalValue *> &Imported) {
  if (auto it = Imported.find(SrcFn); it != Imported.end())
    return cast<Function>(it->second);

  if (Function *Existing = DestM.getFunction(SrcFn->getName())) {
    Imported[SrcFn] = Existing;
    return Existing;
  }

  Function *NewFn = Function::Create(
      SrcFn->getFunctionType(), SrcFn->getLinkage(), SrcFn->getName(), &DestM);
  NewFn->copyAttributesFrom(SrcFn);
  // Register before recursing into the body, in case of (mutual) recursion.
  Imported[SrcFn] = NewFn;

  if (SrcFn->isDeclaration())
    return NewFn;

  ValueToValueMapTy VMap;
  auto destArgIt = NewFn->arg_begin();
  for (Argument &SrcArg : SrcFn->args()) {
    if (SrcArg.hasName())
      destArgIt->setName(SrcArg.getName());
    VMap[&SrcArg] = &*destArgIt;
    ++destArgIt;
  }

  for (auto &BB : *SrcFn)
    for (auto &I : BB)
      for (Use &U : I.operands())
        if (auto *InnerGV = dyn_cast<GlobalValue>(U.get()))
          if (!VMap.count(InnerGV))
            VMap[InnerGV] = resolveOrImportGlobal(InnerGV, DestM, Imported);

  SmallVector<ReturnInst *, 8> Returns;
  CloneFunctionInto(NewFn, SrcFn, VMap,
                    CloneFunctionChangeType::DifferentModule, Returns);
  return NewFn;
}

static GlobalValue *
resolveOrImportGlobal(GlobalValue *GV, Module &DestM,
                      DenseMap<GlobalValue *, GlobalValue *> &Imported) {
  if (auto it = Imported.find(GV); it != Imported.end())
    return it->second;

  if (auto *Fn = dyn_cast<Function>(GV))
    return importFunction(Fn, DestM, Imported);

  if (auto *GVar = dyn_cast<GlobalVariable>(GV)) {
    if (GlobalVariable *Existing =
            DestM.getGlobalVariable(GVar->getName(), true)) {
      Imported[GV] = Existing;
      return Existing;
    }
    auto *NewGV = new GlobalVariable(DestM, GVar->getValueType(),
                                     GVar->isConstant(), GVar->getLinkage(),
                                     /*Initializer=*/nullptr, GVar->getName());
    NewGV->copyAttributesFrom(GVar);
    Imported[GV] = NewGV;
    if (GVar->hasInitializer()) {
      errs() << "Warning: global variable '" << GVar->getName()
             << "' has an initializer that fuseback does not transfer; "
                "declared without one.\n";
    }
    return NewGV;
  }

  errs() << "Warning: unsupported global value kind referenced ('"
         << GV->getName() << "'); leaving reference unresolved.\n";
  return GV;
}

//===----------------------------------------------------------------------===//
// import the faulted body under a fresh name (does NOT reuse an existing one)
//===----------------------------------------------------------------------===//

static Function *
importRenamed(Function *SrcFn, Module &DestM, const std::string &NewName,
              DenseMap<GlobalValue *, GlobalValue *> &Imported) {
  Function *NewFn = Function::Create(SrcFn->getFunctionType(),
                                     SrcFn->getLinkage(), NewName, &DestM);
  NewFn->copyAttributesFrom(SrcFn);

  ValueToValueMapTy VMap;
  auto destArgIt = NewFn->arg_begin();
  for (Argument &SrcArg : SrcFn->args()) {
    if (SrcArg.hasName())
      destArgIt->setName(SrcArg.getName());
    VMap[&SrcArg] = &*destArgIt;
    ++destArgIt;
  }

  for (auto &BB : *SrcFn)
    for (auto &I : BB)
      for (Use &U : I.operands())
        if (auto *GV = dyn_cast<GlobalValue>(U.get()))
          if (!VMap.count(GV))
            VMap[GV] = resolveOrImportGlobal(GV, DestM, Imported);

  SmallVector<ReturnInst *, 8> Returns;
  CloneFunctionInto(NewFn, SrcFn, VMap, CloneFunctionChangeType::DifferentModule,
                    Returns);
  return NewFn;
}

//===----------------------------------------------------------------------===//
// occurrence-gated call-site dispatch
//
// At every call site of Orig, insert:
//     c1 = ++count;
//     if (c1 == target) r = Faulted(args); else r = Orig(args);
// so exactly the target-th dynamic occurrence runs the faulted body.
//===----------------------------------------------------------------------===//

static void gateCallSites(Module &M, Function *Orig, Function *Faulted,
                          GlobalVariable *Cnt, GlobalVariable *Tgt) {
  LLVMContext &Ctx = M.getContext();
  Type *I32 = Type::getInt32Ty(Ctx);

  // Collect first; we mutate the CFG as we go.
  std::vector<CallInst *> Sites;
  for (Function &F : M) {
    if (&F == Faulted)
      continue; // never gate the faulted body's own calls
    for (BasicBlock &BB : F)
      for (Instruction &I : BB)
        if (auto *CI = dyn_cast<CallInst>(&I))
          if (CI->getCalledFunction() == Orig)
            Sites.push_back(CI);
  }

  for (CallInst *CI : Sites) {
    Function *Par = CI->getFunction();
    BasicBlock *BB = CI->getParent();

    // Split so that CI (and everything after) lands in Cont.
    BasicBlock *Cont = BB->splitBasicBlock(CI, "fi.cont");
    BB->getTerminator()->eraseFromParent(); // remove the auto-inserted br

    IRBuilder<> B(BB);
    Value *C = B.CreateLoad(I32, Cnt, "fi.c");
    Value *C1 = B.CreateAdd(C, ConstantInt::get(I32, 1), "fi.c1");
    B.CreateStore(C1, Cnt);
    Value *T = B.CreateLoad(I32, Tgt, "fi.t");
    Value *Armed = B.CreateICmpEQ(C1, T, "fi.armed");

    BasicBlock *FB = BasicBlock::Create(Ctx, "fi.faulted", Par, Cont);
    BasicBlock *OB = BasicBlock::Create(Ctx, "fi.orig", Par, Cont);
    B.CreateCondBr(Armed, FB, OB);

    SmallVector<Value *, 8> Args(CI->arg_begin(), CI->arg_end());

    IRBuilder<> BF(FB);
    CallInst *FC = BF.CreateCall(Faulted->getFunctionType(), Faulted, Args);
    FC->setCallingConv(CI->getCallingConv());
    FC->setAttributes(CI->getAttributes());
    FC->setDebugLoc(CI->getDebugLoc());
    BF.CreateBr(Cont);

    IRBuilder<> BO(OB);
    CallInst *OC = BO.CreateCall(Orig->getFunctionType(), Orig, Args);
    OC->setCallingConv(CI->getCallingConv());
    OC->setAttributes(CI->getAttributes());
    OC->setDebugLoc(CI->getDebugLoc());
    BO.CreateBr(Cont);

    if (!CI->getType()->isVoidTy()) {
      IRBuilder<> BC(CI);
      PHINode *Phi = BC.CreatePHI(CI->getType(), 2, "fi.res");
      Phi->addIncoming(FC, FB);
      Phi->addIncoming(OC, OB);
      CI->replaceAllUsesWith(Phi);
    }
    CI->eraseFromParent();
  }

  errs() << "gate: dispatched " << Sites.size() << " call site(s) of "
         << Orig->getName() << "\n";
}

static void dumpModule(Module &M, const std::string &filename) {
  SmallString<256> path(filename);
  sys::path::remove_filename(path);
  if (!path.empty()) {
    if (std::error_code EC = sys::fs::create_directories(path)) {
      errs() << "Failed to create directories: " << EC.message() << "\n";
      return;
    }
  }
  std::error_code EC;
  raw_fd_ostream out(filename, EC);
  if (EC) {
    errs() << "Failed to open file '" << filename << "': " << EC.message()
           << "\n";
    return;
  }
  M.print(out, nullptr);
}

// ---------------------------------------------------------------------
// main
// ---------------------------------------------------------------------

int main(int argc, char **argv) {
  if (argc < 4 || argc > 5) {
    std::cerr << "Usage: ./fuse_back <base.ll> <function.ll> <functionName> "
                 "[targetOccurrence]\n";
    return 1;
  }

  std::string baseFile = argv[1];
  std::string fnFile = argv[2];
  std::string funcName = argv[3];
  unsigned targetOcc = (argc >= 5) ? std::stoul(argv[4]) : 1u;

  LLVMContext ctx;
  SMDiagnostic err;

  auto baseModule = parseIRFile(baseFile, err, ctx);
  if (!baseModule) {
    errs() << "Error parsing base IR file: " << baseFile << "\n";
    err.print(argv[0], errs());
    return 1;
  }

  auto fnModule = parseIRFile(fnFile, err, ctx);
  if (!fnModule) {
    errs() << "Error parsing function IR file: " << fnFile << "\n";
    err.print(argv[0], errs());
    return 1;
  }

  Function *SrcF = fnModule->getFunction(funcName);
  if (!SrcF || SrcF->isDeclaration()) {
    errs() << "Error: '" << funcName << "' is not defined (with a body) in "
           << fnFile << "\n";
    return 1;
  }

  Function *Orig = baseModule->getFunction(funcName);
  if (!Orig) {
    errs() << "Error: '" << funcName << "' does not exist in " << baseFile
           << "\n";
    return 1;
  }

  if (SrcF->arg_size() != Orig->arg_size()) {
    errs() << "Error: argument count mismatch for '" << funcName
           << "': " << SrcF->arg_size() << " in " << fnFile << " vs "
           << Orig->arg_size() << " in " << baseFile << "\n";
    return 1;
  }
  if (SrcF->getFunctionType() != Orig->getFunctionType())
    errs() << "Warning: type mismatch for '" << funcName
           << "'; gate dispatch may be invalid.\n";

  // 1. Import the faulted body under a fresh name; the original is kept intact.
  std::string faultedName = funcName + "__faulted";
  unsigned uniq = 0;
  while (baseModule->getNamedValue(faultedName))
    faultedName = funcName + "__faulted" + std::to_string(++uniq);
  DenseMap<GlobalValue *, GlobalValue *> imported;
  Function *Faulted = importRenamed(SrcF, *baseModule, faultedName, imported);
  errs() << "import: faulted body added as '" << faultedName << "'\n";

  // 2. Gate globals: a program-wide occurrence counter and the target index.
  Type *I32 = Type::getInt32Ty(ctx);
  std::string safe = funcName;
  for (char &c : safe)
    if (!std::isalnum((unsigned char)c) && c != '_')
      c = '_';
  auto *Cnt = new GlobalVariable(*baseModule, I32, /*isConstant=*/false,
                                 GlobalValue::InternalLinkage,
                                 ConstantInt::get(I32, 0), "__fi_count_" + safe);
  Cnt->setAlignment(Align(4));
  auto *Tgt = new GlobalVariable(
      *baseModule, I32, /*isConstant=*/false, GlobalValue::InternalLinkage,
      ConstantInt::get(I32, targetOcc), "__fi_target_" + safe);
  Tgt->setAlignment(Align(4));

  // 3. Rewrite every call site of Orig into the occurrence gate.
  gateCallSites(*baseModule, Orig, Faulted, Cnt, Tgt);
  errs() << "gate: target occurrence = " << targetOcc << "\n";

  // 4. Verify.
  std::string verifyErrors;
  raw_string_ostream verifyStream(verifyErrors);
  if (verifyModule(*baseModule, &verifyStream)) {
    errs() << "Warning: merged module failed verification:\n"
           << verifyStream.str()
           << "(continuing anyway -- inspect the output manually)\n";
  }

  // 5. Write to tests_kyber/<func>/**/full_kyber/kyber_<stem>.ll (unchanged path).
  SmallString<256> outDir(sys::path::parent_path(fnFile));
  sys::path::append(outDir, "full_kyber");
  if (std::error_code EC = sys::fs::create_directories(outDir)) {
    errs() << "Failed to create output directory: " << EC.message() << "\n";
    return 1;
  }

  std::string fnStem = sys::path::stem(fnFile).str();
  std::string outName = "kyber_" + fnStem + ".ll";

  SmallString<256> outFile(outDir);
  sys::path::append(outFile, outName);
  dumpModule(*baseModule, outFile.str().str());
  outs() << "Wrote " << outFile << "\n";
  return 0;
}
