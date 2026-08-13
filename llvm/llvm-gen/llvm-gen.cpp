#include "clang/Basic/DiagnosticOptions.h"
#include "clang/CodeGen/CodeGenAction.h"
#include "clang/Driver/Driver.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/CompilerInvocation.h"
#include "clang/Frontend/TextDiagnosticPrinter.h"
#include "clang/Frontend/Utils.h"

#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Linker/Linker.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/VirtualFileSystem.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/Transforms/AggressiveInstCombine/AggressiveInstCombine.h"
#include "llvm/Transforms/IPO/GlobalDCE.h"
#include "llvm/Transforms/IPO/GlobalOpt.h"
#include "llvm/Transforms/IPO/Inliner.h"
#include "llvm/Transforms/IPO/SCCP.h"
#include "llvm/Transforms/IPO/StripDeadPrototypes.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar/CorrelatedValuePropagation.h"
#include "llvm/Transforms/Scalar/IndVarSimplify.h"
#include "llvm/Transforms/Scalar/InstSimplifyPass.h"
#include "llvm/Transforms/Scalar/LoopDeletion.h"
#include "llvm/Transforms/Scalar/LoopUnrollPass.h"
#include "llvm/Transforms/Scalar/SCCP.h"
#include "llvm/Transforms/Scalar/SROA.h"
#include "llvm/Transforms/Scalar/SimplifyCFG.h"
#include "llvm/Transforms/Utils/LoopSimplify.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"

#include <llvm-20/llvm/Analysis/InlineCost.h>
#include <llvm-20/llvm/Transforms/IPO/ModuleInliner.h>

#include <memory>
#include <string>
#include <vector>

using namespace llvm;

static bool lowerIntrinsic(CallInst *CI) {

  Function *Callee = CI->getCalledFunction();
  if (!Callee || !Callee->isIntrinsic())
    return false;

  IRBuilder<> B(CI);

  switch (Callee->getIntrinsicID()) {

  case Intrinsic::memset: {
    auto *MSI = cast<MemSetInst>(CI);

    Module *M = CI->getModule();
    LLVMContext &Ctx = M->getContext();

    auto *I8PtrTy = PointerType::getUnqual(Ctx);
    auto *I8Ty = Type::getInt8Ty(Ctx);
    auto *I32Ty = Type::getInt32Ty(Ctx);

    FunctionCallee Fn = M->getOrInsertFunction(
        "kyber_memset", Type::getVoidTy(Ctx), I8PtrTy, I8Ty, I32Ty);

    IRBuilder<> B(CI);

    B.CreateCall(Fn, {MSI->getDest(), MSI->getValue(), MSI->getLength()});

    CI->eraseFromParent();
    return true;
  }

  case Intrinsic::memcpy: {
    auto *MCI = cast<MemCpyInst>(CI);

    Module *M = CI->getModule();
    LLVMContext &Ctx = M->getContext();

    auto *I8PtrTy = PointerType::getUnqual(Ctx);
    auto *I32Ty = Type::getInt32Ty(Ctx);

    FunctionCallee Fn = M->getOrInsertFunction(
        "kyber_memcpy", Type::getVoidTy(Ctx), I8PtrTy, I8PtrTy, I32Ty);

    IRBuilder<> B(CI);

    B.CreateCall(Fn, {MCI->getDest(), MCI->getSource(), MCI->getLength()});

    CI->eraseFromParent();
    return true;
  }
  // llvm.smax.i32
  case Intrinsic::smax: {
    Value *A = CI->getArgOperand(0);
    Value *Bv = CI->getArgOperand(1);

    Value *Cmp = B.CreateICmpSGT(A, Bv);
    Value *Res = B.CreateSelect(Cmp, A, Bv);

    CI->replaceAllUsesWith(Res);
    CI->eraseFromParent();
    return true;
  }

  // llvm.umin.i32
  case Intrinsic::umin: {
    Value *A = CI->getArgOperand(0);
    Value *Bv = CI->getArgOperand(1);

    Value *Cmp = B.CreateICmpULT(A, Bv);
    Value *Res = B.CreateSelect(Cmp, A, Bv);

    CI->replaceAllUsesWith(Res);
    CI->eraseFromParent();
    return true;
  }

  // llvm.fshl
  case Intrinsic::fshl: {

    Value *X = CI->getArgOperand(0);
    Value *Y = CI->getArgOperand(1);
    Value *Shift = CI->getArgOperand(2);

    IntegerType *Ty = cast<IntegerType>(X->getType());

    unsigned BW = Ty->getBitWidth();

    Value *BWVal = ConstantInt::get(Ty, BW);

    Value *Mask = ConstantInt::get(Ty, BW - 1);

    Shift = B.CreateAnd(Shift, Mask);

    Value *Left = B.CreateShl(X, Shift);

    Value *Sub = B.CreateSub(BWVal, Shift);

    Value *Right = B.CreateLShr(Y, Sub);

    Value *Res = B.CreateOr(Left, Right);

    CI->replaceAllUsesWith(Res);
    CI->eraseFromParent();
    return true;
  }

  // llvm.bswap
  case Intrinsic::bswap: {

    Value *X = CI->getArgOperand(0);

    IntegerType *Ty = cast<IntegerType>(X->getType());

    unsigned BW = Ty->getBitWidth();

    if (BW == 32) {

      Value *B0 = B.CreateAnd(X, ConstantInt::get(Ty, 0x000000FF));
      B0 = B.CreateShl(B0, 24);

      Value *B1 = B.CreateAnd(X, ConstantInt::get(Ty, 0x0000FF00));
      B1 = B.CreateShl(B1, 8);

      Value *B2 = B.CreateAnd(X, ConstantInt::get(Ty, 0x00FF0000));
      B2 = B.CreateLShr(B2, 8);

      Value *B3 = B.CreateAnd(X, ConstantInt::get(Ty, 0xFF000000));
      B3 = B.CreateLShr(B3, 24);

      Value *Res = B.CreateOr(B0, B1);
      Res = B.CreateOr(Res, B2);
      Res = B.CreateOr(Res, B3);

      CI->replaceAllUsesWith(Res);
      CI->eraseFromParent();
      return true;
    }

    if (BW == 64) {

      Value *Res = ConstantInt::get(Ty, 0);

      for (unsigned i = 0; i < 8; i++) {

        uint64_t Mask = 0xFFULL << (8 * i);

        Value *Byte = B.CreateAnd(X, ConstantInt::get(Ty, Mask));

        if (i < 7 - i)
          Byte = B.CreateShl(Byte, 8 * (7 - 2 * i));
        else if (i > 7 - i)
          Byte = B.CreateLShr(Byte, 8 * (2 * i - 7));

        Res = B.CreateOr(Res, Byte);
      }

      CI->replaceAllUsesWith(Res);
      CI->eraseFromParent();
      return true;
    }

    return false;
  }

  default:
    return false;
  }
}

std::unique_ptr<Module> c2ir(const std::vector<std::string> &filepaths,
                             const std::vector<std::string> &includeDirs,
                             const std::vector<std::string> &defines,
                             LLVMContext &llvm_ctx) {
  auto composite = std::make_unique<Module>("kyber_composite", llvm_ctx);
  // composite->setTargetTriple("arm-unknown-none-eabi");
  composite->setTargetTriple("thumbv7em-unknown-none-eabihf");

  Linker linker(*composite);

  for (const auto &filepath : filepaths) {
    clang::CompilerInstance compiler;

    auto VFS = llvm::vfs::getRealFileSystem();
    compiler.createDiagnostics(
        *VFS, new clang::TextDiagnosticPrinter(llvm::errs(),
                                               new clang::DiagnosticOptions()));

    // std::vector<const char *> args = {
    //     "clang-tool",
    //     "-O0",
    //     // "-fomit-frame-pointer",
    // };
    std::vector<const char *> args = {
        "clang-tool",
        "-O0",
        "-ffreestanding",
        "-triple",
        "thumbv7em-unknown-none-eabihf",
        "-target-cpu",
        "cortex-m4",
        "-target-abi",
        "aapcs-vfp",
        "-target-feature",
        "+vfp4d16sp",
        "-target-feature",
        "+dsp",
        "-target-feature",
        "+fp16",
        "-target-feature",
        "+hwdiv",
        // "-fno-builtin",
    };

    auto &CGO = compiler.getInvocation().getCodeGenOpts();
    CGO.setDebugInfo(llvm::codegenoptions::FullDebugInfo);
    CGO.DebugColumnInfo = true;

    // Run clang -print-resource-dir programmatically
    FILE *pipe = popen("clang-20 -print-resource-dir 2>/dev/null", "r");
    char buf[256];
    fgets(buf, sizeof(buf), pipe);
    pclose(pipe);
    std::string resourceDir = std::string(buf);
    resourceDir.erase(resourceDir.find_last_not_of(" \n\r") + 1);

    // std::string resourceDir = "/usr/local/lib/clang/23";

    args.push_back("-Wno-macro-redefined");
    args.push_back("-resource-dir");
    args.push_back(resourceDir.c_str());

    args.push_back("-ffreestanding");
    args.push_back("-fno-builtin");

    compiler.getInvocation().getHeaderSearchOpts().Sysroot =
        "/usr/lib/arm-none-eabi";

    args.push_back("-isystem");
    args.push_back("/usr/lib/arm-none-eabi/include");

    args.push_back("-isystem");
    args.push_back("/usr/lib/gcc/arm-none-eabi/13.2.1/include");

    std::string builtinInclude = resourceDir + "/include";
    args.push_back("-internal-isystem");
    args.push_back(strdup(builtinInclude.c_str()));

    // User include directories (-I)
    for (const auto &dir : includeDirs) {
      args.push_back("-I");
      args.push_back(dir.c_str());
    }

    std::vector<std::string> defFlags;
    for (const auto &def : defines) {
      defFlags.push_back("-D" + def);
    }
    for (const auto &f : defFlags) {
      args.push_back(f.c_str());
    }

    clang::CompilerInvocation::CreateFromArgs(compiler.getInvocation(), args,
                                              compiler.getDiagnostics());

    // auto &CGO = compiler.getInvocation().getCodeGenOpts();
    // CGO.setDebugInfo(llvm::codegenoptions::FullDebugInfo);
    // CGO.DebugColumnInfo = true;
    CGO.FloatABI = "hard";
    CGO.RelocationModel = llvm::Reloc::Model::Static;
    CGO.CodeModel = "small";

    // compiler.getInvocation().getTargetOpts().Triple =
    // "arm-unknown-none-eabi"; auto &TO =
    // compiler.getInvocation().getTargetOpts(); TO.CPU = "cortex-m4";
    // TO.Features = {"+thumb2"};

    auto &frontendOpts = compiler.getInvocation().getFrontendOpts();
    frontendOpts.Inputs.clear();
    frontendOpts.Inputs.emplace_back(filepath, clang::Language::C);

    compiler.createFileManager();
    compiler.createSourceManager(compiler.getFileManager());

    auto TO_shared = std::make_shared<clang::TargetOptions>(
        compiler.getInvocation().getTargetOpts());

    compiler.setTarget(clang::TargetInfo::CreateTargetInfo(
        compiler.getDiagnostics(), TO_shared));

    auto action = std::make_unique<clang::EmitLLVMOnlyAction>(&llvm_ctx);
    if (!compiler.ExecuteAction(*action)) {
      llvm::errs() << "Compilation failed for: " << filepath << "\n";
      return nullptr;
    }

    std::unique_ptr<Module> mod = action->takeModule();
    if (!mod) {
      llvm::errs() << "Module generation failed for: " << filepath << "\n";
      return nullptr;
    }

    if (linker.linkInModule(std::move(mod))) {
      llvm::errs() << "Linking failed for: " << filepath << "\n";
      return nullptr;
    }
  }

  return composite;
}
std::unique_ptr<Module> ir2Module(const std::string &filepath,
                                  LLVMContext &llvm_ctx) {

  SMDiagnostic error;
  std::unique_ptr<llvm::Module> module =
      llvm::parseIRFile(filepath, error, llvm_ctx);
  if (!module)
    return nullptr;

  return module;
}
void stripOptnoneNoinline(llvm::Module &module) {
  for (Function &F : module) {
    F.removeFnAttr(Attribute::OptimizeNone);
    F.removeFnAttr(Attribute::NoInline);
  }
}

void prepare(std::unique_ptr<llvm::Module> &module) {

  stripOptnoneNoinline(*module);
  LoopAnalysisManager LAM;
  FunctionAnalysisManager FAM;
  CGSCCAnalysisManager CGAM;
  ModuleAnalysisManager MAM;

  PassBuilder PB;

  PB.registerModuleAnalyses(MAM);
  PB.registerCGSCCAnalyses(CGAM);
  PB.registerFunctionAnalyses(FAM);
  PB.registerLoopAnalyses(LAM);
  PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

  ModulePassManager MPM;
  MPM.addPass(GlobalOptPass());

  // inlining
  // {
  //   InlineParams IP;
  //   IP.DefaultThreshold = 10000;
  //   MPM.addPass(ModuleInlinerPass(IP));
  // }

  // constants
  {
    FunctionPassManager FPM;
    FPM.addPass(PromotePass());
    FPM.addPass(SROAPass(SROAOptions::ModifyCFG));
    FPM.addPass(SCCPPass());
    FPM.addPass(CorrelatedValuePropagationPass());
    FPM.addPass(InstCombinePass());
    FPM.addPass(SimplifyCFGPass());
    MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
  }

  MPM.addPass(IPSCCPPass());

  // Clean up after IPSCCP
  {
    FunctionPassManager FPM;
    FPM.addPass(InstCombinePass());
    FPM.addPass(SimplifyCFGPass());
    MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
  }

  // Loop
  {
    FunctionPassManager FPM;
    FPM.addPass(LoopSimplifyPass());
    FPM.addPass(createFunctionToLoopPassAdaptor(IndVarSimplifyPass()));
    // FPM.addPass(createFunctionToLoopPassAdaptor(
    //     LoopDeletionPass())); // delete dead loops
    // LoopUnrollOptions LUOpts;
    // LUOpts.setFullUnrollMaxCount(1024); // unroll short loops completely
    // // LUOpts.setPartialOptSizeThreshold(0);
    // FPM.addPass(LoopUnrollPass(LUOpts));
    // FPM.addPass(SCCPPass()); // SCCP again after unrolling
    // FPM.addPass(InstCombinePass());
    // FPM.addPass(SimplifyCFGPass());
    MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
  }

  MPM.addPass(StripDeadPrototypesPass());

  MPM.run(*module, MAM);
}

int main(int argc, char **argv) {

  for (int kyberK = 2; kyberK <= 4; kyberK++) {

    const std::string KYBER_SRC_ROOT = "../../../ref";

    std::vector<std::string> files = {
        KYBER_SRC_ROOT + "/test/test_kyber.c",
        KYBER_SRC_ROOT + "/randombytes.c",
        KYBER_SRC_ROOT + "/kem.c",
        KYBER_SRC_ROOT + "/indcpa.c",
        KYBER_SRC_ROOT + "/polyvec.c",
        KYBER_SRC_ROOT + "/poly.c",
        KYBER_SRC_ROOT + "/ntt.c",
        KYBER_SRC_ROOT + "/cbd.c",
        KYBER_SRC_ROOT + "/reduce.c",
        KYBER_SRC_ROOT + "/verify.c",
        KYBER_SRC_ROOT + "/fips202.c",
        KYBER_SRC_ROOT + "/symmetric-shake.c",
        "../mem.c"
    };

    std::vector<std::string> includeDirs = {
        KYBER_SRC_ROOT,
    };

    std::vector<std::string> defines = {
        "KYBER_K=" + std::to_string(kyberK),
    };

    llvm::LLVMContext llvm_ctx;
    std::unique_ptr<llvm::Module> module =
        c2ir(files, includeDirs, defines, llvm_ctx);

    if (!module) {
      llvm::errs() << "IR generation failed.\n";
      continue;
    }

    // module->setTargetTriple("arm-unknown-none-eabi");
    module->setTargetTriple("thumbv7em-unknown-none-eabihf");

    if (llvm::verifyModule(*module, &llvm::errs())) {
      llvm::errs() << "Module verification failed.\n";
      continue;
    }

    prepare(module);
    bool Changed = false;

    for (Function &F : *module) {
      for (auto BI = F.begin(); BI != F.end(); ++BI) {

        for (auto II = BI->begin(); II != BI->end();) {

          Instruction *I = &*II++;

          if (auto *CI = dyn_cast<CallInst>(I))
            Changed |= lowerIntrinsic(CI);
        }
      }
    }
    if (Changed) {
      for (auto FI = module->begin(); FI != module->end();) {
        Function &F = *FI++;
        if (F.isDeclaration() && F.use_empty())
          F.eraseFromParent();
      }
    }

    verifyModule(*module, &errs());


    int bits = (kyberK == 2) ? 512 : (kyberK == 3) ? 768 : 1024;
    std::string outPath = "../kyber_IR/kyber" + std::to_string(bits) + ".ll";

    std::error_code EC;
    llvm::raw_fd_ostream outFile(outPath, EC);
    if (!EC) {
      module->print(outFile, nullptr);
    }
    llvm::outs() << "Wrote " << kyberK << "\n";
  }

  return 0;
}