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
#include "llvm/Transforms/IPO/StripDeadPrototypes.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar/CorrelatedValuePropagation.h"
#include "llvm/Transforms/Scalar/IndVarSimplify.h"
#include "llvm/Transforms/Scalar/InstSimplifyPass.h"
#include "llvm/Transforms/Scalar/LoopDeletion.h"
#include "llvm/Transforms/Scalar/LoopUnrollPass.h"
#include "llvm/Transforms/Scalar/SCCP.h"
#include "llvm/Transforms/Scalar/SimplifyCFG.h"
#include "llvm/Transforms/Utils/LoopSimplify.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"

#include <llvm-20/llvm/Analysis/InlineCost.h>
#include <llvm-20/llvm/Transforms/IPO/ModuleInliner.h>

#include <memory>
#include <string>
#include <vector>

using namespace llvm;

std::unique_ptr<Module> c2ir(const std::vector<std::string> &filepaths,
                             const std::vector<std::string> &includeDirs,
                             const std::vector<std::string> &defines,
                             LLVMContext &llvm_ctx) {
  auto composite = std::make_unique<Module>("kyber_composite", llvm_ctx);
  composite->setTargetTriple("arm-unknown-none-eabi");

  Linker linker(*composite);

  for (const auto &filepath : filepaths) {
    clang::CompilerInstance compiler;

    auto VFS = llvm::vfs::getRealFileSystem();
    compiler.createDiagnostics(
        *VFS, new clang::TextDiagnosticPrinter(llvm::errs(),
                                               new clang::DiagnosticOptions()));

    std::vector<const char *> args = {
        "clang-tool",
        "-O0",
        // "-fomit-frame-pointer",
    };

    std::string resourceDir = "/usr/local/lib/clang/23"; // adjust if needed

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
    args.push_back(
        strdup(builtinInclude.c_str())); // lifetime ok – process-scoped

    // User include directories (-I)
    for (const auto &dir : includeDirs) {
      args.push_back("-I");
      args.push_back(dir.c_str());
    }

    // User defines (-D)
    std::vector<std::string> defFlags; // keep strings alive
    for (const auto &def : defines) {
      defFlags.push_back("-D" + def);
    }
    for (const auto &f : defFlags) {
      args.push_back(f.c_str());
    }

    clang::CompilerInvocation::CreateFromArgs(compiler.getInvocation(), args,
                                              compiler.getDiagnostics());

    auto &CGO = compiler.getInvocation().getCodeGenOpts();
    CGO.setDebugInfo(llvm::codegenoptions::FullDebugInfo);
    CGO.DebugColumnInfo = true;
    CGO.FloatABI = "soft"; // Cortex-M4 soft-float (change to "hard" for FPU)
    CGO.RelocationModel = llvm::Reloc::Model::Static;
    CGO.CodeModel = "small";

    compiler.getInvocation().getTargetOpts().Triple = "arm-unknown-none-eabi";
    auto &TO = compiler.getInvocation().getTargetOpts();
    TO.CPU = "cortex-m4";
    TO.Features = {"+thumb2"};

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

  // constants
  {
    FunctionPassManager FPM;
    FPM.addPass(PromotePass());
    FPM.addPass(SCCPPass());
    FPM.addPass(InstCombinePass());
    FPM.addPass(SimplifyCFGPass());
    MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
  }

  // inlining
  {
    InlineParams IP;
    IP.DefaultThreshold = 100;
    MPM.addPass(ModuleInlinerPass(IP));
  }

  {
    FunctionPassManager FPM;
    FPM.addPass(PromotePass());
    FPM.addPass(SCCPPass());
    FPM.addPass(CorrelatedValuePropagationPass());
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

    const std::string KYBER_SRC_ROOT = "../../ref";

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
      return 1;
    }

    module->setTargetTriple("arm-unknown-none-eabi");

    if (llvm::verifyModule(*module, &llvm::errs())) {
      llvm::errs() << "Module verification failed.\n";
      return 1;
    }

    prepare(module);

    int bits = (kyberK == 2) ? 512 : (kyberK == 3) ? 768 : 1024;
    std::string outPath = "../inline/kyber" + std::to_string(bits) + ".ll";

    std::error_code EC;
    llvm::raw_fd_ostream outFile(outPath, EC);
    if (EC) {
      llvm::errs() << "Cannot open " << outPath << ": " << EC.message() << "\n";
      return 1;
    }

    module->print(outFile, nullptr);
    llvm::outs() << "Successfully wrote " << kyberK << "\n";
  }

  return 0;
}