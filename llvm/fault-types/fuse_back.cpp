#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

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
  if (argc != 4) {
    std::cerr << "Usage: ./fuseback <base.ll> <function.ll> <functionName>\n";
    return 1;
  }

  std::string baseFile = argv[1];
  std::string fnFile = argv[2];
  std::string funcName = argv[3];

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

  Function *DestF = baseModule->getFunction(funcName);
  if (!DestF) {
    errs() << "Error: '" << funcName << "' does not exist in " << baseFile
           << "\n";
    return 1;
  }

  if (SrcF->arg_size() != DestF->arg_size()) {
    errs() << "Error: argument count mismatch for '" << funcName
           << "': " << SrcF->arg_size() << " in " << fnFile << " vs "
           << DestF->arg_size() << " in " << baseFile << "\n";
    return 1;
  }

  if (SrcF->getReturnType() != DestF->getReturnType()) {
    errs() << "Warning: return type mismatch for '" << funcName
           << "'; proceeding anyway.\n";
  }

  errs() << "Replacing definition of '" << funcName << "' in " << baseFile
         << " with the version from " << fnFile << "\n";

  DestF->deleteBody();

  ValueToValueMapTy VMap;
  auto destArgIt = DestF->arg_begin();
  for (Argument &SrcArg : SrcF->args()) {
    VMap[&SrcArg] = &*destArgIt;
    ++destArgIt;
  }

  DenseMap<GlobalValue *, GlobalValue *> imported;
  for (auto &BB : *SrcF)
    for (auto &I : BB)
      for (Use &U : I.operands())
        if (auto *GV = dyn_cast<GlobalValue>(U.get()))
          if (!VMap.count(GV))
            VMap[GV] = resolveOrImportGlobal(GV, *baseModule, imported);

  SmallVector<ReturnInst *, 8> Returns;
  CloneFunctionInto(DestF, SrcF, VMap, CloneFunctionChangeType::DifferentModule,
                    Returns);

  std::string verifyErrors;
  raw_string_ostream verifyStream(verifyErrors);
  if (verifyModule(*baseModule, &verifyStream)) {
    errs() << "Warning: merged module failed verification:\n"
           << verifyStream.str()
           << "(continuing anyway -- inspect the output manually)\n";
  }

  SmallString<256> outDir(sys::path::parent_path(fnFile));

  sys::path::append(outDir, "full_kyber");

  std::error_code EC = sys::fs::create_directories(outDir);
  if (EC) {
    errs() << "Failed to create output directory: " << EC.message() << "\n";
    return 1;
  }

  std::string fnStem = sys::path::stem(fnFile).str();

  // Construct output filename: kyber_<fnFileStem>.ll
  std::string outName = "kyber_" + fnStem + ".ll";

  // Construct full output path
  SmallString<256> outFile(outDir);
  sys::path::append(outFile, outName);
  dumpModule(*baseModule, outFile.str().str());
  outs() << "Wrote " << outFile << "\n";

  return 0;
}