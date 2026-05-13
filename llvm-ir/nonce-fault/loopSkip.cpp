#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Transforms/IPO/GlobalOpt.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar/CorrelatedValuePropagation.h"
#include "llvm/Transforms/Scalar/IndVarSimplify.h"
#include "llvm/Transforms/Scalar/LoopRotation.h"
#include "llvm/Transforms/Scalar/LoopUnrollPass.h"
#include "llvm/Transforms/Scalar/SCCP.h"
#include "llvm/Transforms/Scalar/SimplifyCFG.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"

#include "llvm/Analysis/LoopAnalysisManager.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/IR/Analysis.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/Casting.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <cstdio>
#include <cstdlib>
#include <iostream>

#include <map>
#include <memory>
#include <vector>

using namespace llvm;

enum FaultMode { LOOP_SKIP = 0, FUNC_SKIP = 1 };

/// Lowers LLVM intrinsics to basic IR instructions.
class LowerIntrinsicsPass : public PassInfoMixin<LowerIntrinsicsPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
    bool changed = false;
    std::vector<Instruction *> toErase;

    for (auto &BB : F) {
      for (auto &I : BB) {
        auto *II = dyn_cast<IntrinsicInst>(&I);
        if (!II) continue;

        IRBuilder<> Builder(II);
        switch (II->getIntrinsicID()) {
        case Intrinsic::fshl: {
          Value *A = II->getArgOperand(0);
          Value *B = II->getArgOperand(1);
          Value *C = II->getArgOperand(2);
          unsigned bitWidth = A->getType()->getIntegerBitWidth();
          Value *bwVal = ConstantInt::get(A->getType(), bitWidth);
          Value *shAmt = Builder.CreateURem(C, bwVal);
          Value *invAmt = Builder.CreateSub(bwVal, shAmt);
          Value *hi = Builder.CreateShl(A, shAmt);
          Value *lo = Builder.CreateLShr(B, invAmt);
          Value *isZero = Builder.CreateICmpEQ(shAmt, ConstantInt::get(A->getType(), 0));
          Value *merged = Builder.CreateOr(hi, lo);
          Value *result = Builder.CreateSelect(isZero, A, merged);
          II->replaceAllUsesWith(result);
          toErase.push_back(II);
          changed = true;
          break;
        }
        case Intrinsic::umax: {
          Value *A = II->getArgOperand(0);
          Value *B = II->getArgOperand(1);
          Value *cmp = Builder.CreateICmpUGT(A, B);
          II->replaceAllUsesWith(Builder.CreateSelect(cmp, A, B));
          toErase.push_back(II);
          changed = true;
          break;
        }
        case Intrinsic::lifetime_start:
        case Intrinsic::lifetime_end: {
          toErase.push_back(II);
          changed = true;
          break;
        }
        // Add more intrinsics if needed (fshr, umin, etc.)
        default: break;
        }
      }
    }
    for (auto *I : toErase) I->eraseFromParent();
    return changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
  }
};

// for memcpy/memset/memcmp.
void LibraryBodies(Module &M) {
  LLVMContext &Ctx = M.getContext();
  IRBuilder<> Builder(Ctx);

  auto createMemcpy = [&](Function *F) {
    if (!F || !F->isDeclaration()) return;
    F->setLinkage(GlobalValue::InternalLinkage);
    BasicBlock *entry = BasicBlock::Create(Ctx, "entry", F);
    BasicBlock *loop = BasicBlock::Create(Ctx, "loop", F);
    BasicBlock *exit = BasicBlock::Create(Ctx, "exit", F);
    auto args = F->arg_begin();
    Value *dest = &*args++; Value *src = &*args++; Value *n = &*args++;
    Builder.SetInsertPoint(entry);
    Value *cmp0 = Builder.CreateICmpEQ(n, ConstantInt::get(n->getType(), 0));
    Builder.CreateCondBr(cmp0, exit, loop);
    Builder.SetInsertPoint(loop);
    PHINode *idx = Builder.CreatePHI(n->getType(), 2);
    idx->addIncoming(ConstantInt::get(n->getType(), 0), entry);
    Value *val = Builder.CreateLoad(Builder.getInt8Ty(), Builder.CreateGEP(Builder.getInt8Ty(), src, idx));
    Builder.CreateStore(val, Builder.CreateGEP(Builder.getInt8Ty(), dest, idx));
    Value *next = Builder.CreateAdd(idx, ConstantInt::get(n->getType(), 1));
    idx->addIncoming(next, loop);
    Builder.CreateCondBr(Builder.CreateICmpEQ(next, n), exit, loop);
    Builder.SetInsertPoint(exit);
    Builder.CreateRet(dest);
  };

  auto createMemset = [&](Function *F) {
    if (!F || !F->isDeclaration()) return;
    F->setLinkage(GlobalValue::InternalLinkage);
    BasicBlock *entry = BasicBlock::Create(Ctx, "entry", F);
    BasicBlock *loop = BasicBlock::Create(Ctx, "loop", F);
    BasicBlock *exit = BasicBlock::Create(Ctx, "exit", F);
    auto args = F->arg_begin();
    Value *dest = &*args++; Value *c = &*args++; Value *n = &*args++;
    Builder.SetInsertPoint(entry);
    Value *cmp0 = Builder.CreateICmpEQ(n, ConstantInt::get(n->getType(), 0));
    Builder.CreateCondBr(cmp0, exit, loop);
    Builder.SetInsertPoint(loop);
    PHINode *idx = Builder.CreatePHI(n->getType(), 2);
    idx->addIncoming(ConstantInt::get(n->getType(), 0), entry);
    Value *byteVal = Builder.CreateTrunc(c, Builder.getInt8Ty());
    Builder.CreateStore(byteVal, Builder.CreateGEP(Builder.getInt8Ty(), dest, idx));
    Value *next = Builder.CreateAdd(idx, ConstantInt::get(n->getType(), 1));
    idx->addIncoming(next, loop);
    Builder.CreateCondBr(Builder.CreateICmpEQ(next, n), exit, loop);
    Builder.SetInsertPoint(exit);
    Builder.CreateRet(dest);
  };

  auto createMemcmp = [&](Function *F) {
    if (!F || !F->isDeclaration()) return;
    F->setLinkage(GlobalValue::InternalLinkage);
    BasicBlock *entry = BasicBlock::Create(Ctx, "entry", F);
    BasicBlock *loop = BasicBlock::Create(Ctx, "loop", F);
    BasicBlock *exit = BasicBlock::Create(Ctx, "exit", F);
    auto args = F->arg_begin();
    Value *s1 = &*args++; Value *s2 = &*args++; Value *n = &*args++;
    Builder.SetInsertPoint(entry);
    Value *cmp0 = Builder.CreateICmpEQ(n, ConstantInt::get(n->getType(), 0));
    Builder.CreateCondBr(cmp0, exit, loop);
    Builder.SetInsertPoint(loop);
    PHINode *idx = Builder.CreatePHI(n->getType(), 2);
    idx->addIncoming(ConstantInt::get(n->getType(), 0), entry);
    Value *v1 = Builder.CreateLoad(Builder.getInt8Ty(), Builder.CreateGEP(Builder.getInt8Ty(), s1, idx));
    Value *v2 = Builder.CreateLoad(Builder.getInt8Ty(), Builder.CreateGEP(Builder.getInt8Ty(), s2, idx));
    Value *notEq = Builder.CreateICmpNE(v1, v2);
    BasicBlock *diffBB = BasicBlock::Create(Ctx, "diff", F);
    BasicBlock *nextBB = BasicBlock::Create(Ctx, "next", F);
    Builder.CreateCondBr(notEq, diffBB, nextBB);
    Builder.SetInsertPoint(diffBB);
    Value *res = Builder.CreateSelect(Builder.CreateICmpUGT(v1, v2), Builder.getInt32(1), Builder.getInt32(-1));
    Builder.CreateRet(res);
    Builder.SetInsertPoint(nextBB);
    Value *next = Builder.CreateAdd(idx, ConstantInt::get(n->getType(), 1));
    idx->addIncoming(next, nextBB);
    Builder.CreateCondBr(Builder.CreateICmpEQ(next, n), exit, loop);
    Builder.SetInsertPoint(exit);
    Builder.CreateRet(Builder.getInt32(0));
  };

  createMemcpy(M.getFunction("memcpy"));
  createMemset(M.getFunction("memset"));
  createMemcmp(M.getFunction("memcmp"));
}

class FuncSkip : public PassInfoMixin<FuncSkip> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
    auto &LI = FAM.getResult<LoopAnalysis>(F);
    auto &SE = FAM.getResult<ScalarEvolutionAnalysis>(F);

    std::vector<Loop *> loops(LI.begin(), LI.end());
    for (Loop *L : loops) {
      unsigned tripCount = SE.getSmallConstantTripCount(L);
      if (tripCount == 0) {
        errs() << "cannot determine trip count\n";
        continue;
      }

      errs() << "Loop trip count: " << tripCount << "\n";
      addLabelNUnrollWithFuncSkip(F, L, LI, SE, tripCount, "add_f");
    }
    return PreservedAnalyses::none();
  }

  void addLabelNUnrollWithFuncSkip(Function &F, Loop *L, LoopInfo &LI,
                                   ScalarEvolution &SE, unsigned tripCount,
                                   const std::string &funcToSkip) {
    BasicBlock *header = L->getHeader();
    BasicBlock *latch = L->getLoopLatch();
    BasicBlock *preheader = L->getLoopPreheader();
    BasicBlock *exitBB = L->getUniqueExitBlock();

    if (!header || !latch || !preheader || !exitBB) {
      errs() << "Loop not in simplified form\n";
      return;
    }

    std::vector<BasicBlock *> origBlocks;
    for (BasicBlock *BB : L->blocks()) {
      origBlocks.push_back(BB);
    }

    BasicBlock *prevIterExit = preheader;
    ValueToValueMapTy cumulativeMap;

    for (unsigned i = 0; i < tripCount; i++) {
      // 1. Create start label
      BasicBlock *iterStart = BasicBlock::Create(
          F.getContext(), "iter_" + std::to_string(i) + "_start", &F);

      // 2. Resolve PHI nodes for this iteration
      std::vector<std::pair<PHINode *, Value *>> resolvedPhis;
      for (PHINode &PN : header->phis()) {
        Value *incoming;
        if (i == 0) {
          incoming = PN.getIncomingValueForBlock(preheader);
        } else {
          Value *latchVal = PN.getIncomingValueForBlock(latch);
          if (Value *mapped = cumulativeMap.lookup(latchVal))
            incoming = mapped;
          else
            incoming = latchVal;
        }
        cumulativeMap[&PN] = incoming;
        resolvedPhis.push_back({&PN, incoming});
      }

      // 3. Clone all blocks for this iteration
      std::vector<BasicBlock *> iterationCloned;
      ValueToValueMapTy iterationBlockMap;
      for (BasicBlock *BB : origBlocks) {
        BasicBlock *cloned =
            CloneBasicBlock(BB, cumulativeMap, ".iter" + std::to_string(i), &F);
        iterationCloned.push_back(cloned);
        iterationBlockMap[BB] = cloned;

        // Map individual instructions to their clones
        auto itOrig = BB->begin();
        auto itCloned = cloned->begin();
        while (itOrig != BB->end() && itCloned != cloned->end()) {
          iterationBlockMap[&*itOrig] = &*itCloned;
          // For next iteration's use
          cumulativeMap[&*itOrig] = &*itCloned;
          itOrig++;
          itCloned++;
        }
      }

      // 4. Resolve internal control flow in the cloned iteration
      for (BasicBlock *cloned : iterationCloned) {
        for (Instruction &I : *cloned) {
          RemapInstruction(&I, iterationBlockMap,
                           RF_NoModuleLevelChanges | RF_IgnoreMissingLocals);
        }

        // Skip function calls in the first iteration
        if (i == 0) {
          for (auto It = cloned->begin(); It != cloned->end();) {
            Instruction *I = &*It++;
            auto *CI = dyn_cast<CallInst>(I);
            if (!CI)
              continue;

            Function *callee = CI->getCalledFunction();
            if (callee && callee->getName() == funcToSkip) {
              outs() << "skipping fn call " << callee->getName() << "\n";
              // if (!CI->getType()->isVoidTy()) {
              Value *v = CI->getArgOperand(0);
              // Value *v = Constant::getNullValue(CI->getType());
              CI->replaceAllUsesWith(v);
              // }
              CI->eraseFromParent();
            }
          }
        }
      }

      // 5. Remove PHI nodes from the cloned header as they are now resolved
      for (auto &pair : resolvedPhis) {
        PHINode *origPhi = pair.first;
        Value *resolvedVal = pair.second;
        if (Value *clonedPhiVal = iterationBlockMap.lookup(origPhi)) {
          PHINode *clonedPhi = cast<PHINode>(clonedPhiVal);
          clonedPhi->replaceAllUsesWith(resolvedVal);
          clonedPhi->eraseFromParent();
        }
      }

      // 6. Create end label
      BasicBlock *iterEnd = BasicBlock::Create(
          F.getContext(), "iter_" + std::to_string(i) + "_end", &F);

      // 7. Connect control flow
      if (i == 0) {
        Instruction *prevTerm = preheader->getTerminator();
        BranchInst::Create(iterStart, preheader);
        prevTerm->eraseFromParent();
      } else {
        BranchInst::Create(iterStart, prevIterExit);
      }

      BranchInst::Create(iterationCloned.front(), iterStart);

      BasicBlock *clonedLatch = cast<BasicBlock>(iterationBlockMap[latch]);
      Instruction *latchTerm = clonedLatch->getTerminator();
      BranchInst::Create(iterEnd, clonedLatch);
      latchTerm->eraseFromParent();

      prevIterExit = iterEnd;
    }

    BranchInst::Create(exitBB, prevIterExit);
    for (auto it = exitBB->begin(); isa<PHINode>(it);) {
      PHINode *PN = cast<PHINode>(&*it++);
      Value *incomingVal = nullptr;

      for (unsigned j = 0; j < PN->getNumIncomingValues(); j++) {
        if (L->contains(PN->getIncomingBlock(j))) {
          incomingVal = PN->getIncomingValue(j);
          break;
        }
      }

      if (!incomingVal)
        continue;

      if (Value *mapped = cumulativeMap.lookup(incomingVal))
        incomingVal = mapped;

      while (true) {
        bool removed = false;
        for (unsigned j = 0; j < PN->getNumIncomingValues(); j++) {
          if (L->contains(PN->getIncomingBlock(j))) {
            PN->removeIncomingValue(j, false);
            removed = true;
            break;
          }
        }
        if (!removed)
          break;
      }

      PN->addIncoming(incomingVal, prevIterExit);
    }

    for (BasicBlock *BB : origBlocks) {
      BB->eraseFromParent();
    }
  }
};

void run_command(const std::string &cmd) {
  int ret = system(cmd.c_str());
  if (ret != 0) {
    std::cerr << "Command failed!\n";
    exit(1);
  }
}

void dump_module(Module &M, const std::string &filename) {
  std::error_code EC;
  raw_fd_ostream out(filename, EC);
  M.print(out, nullptr);
  out.close();
}

std::unique_ptr<Module> extractFunction(Module &M, Function *F) {
  auto newMod = CloneModule(M);

  std::set<std::string> keep;
  keep.insert(F->getName().str());

  std::function<void(Function *)> collectCallees = [&](Function *fn) {
    for (auto &BB : *fn) {
      for (auto &I : BB) {
        if (auto *call = dyn_cast<CallInst>(&I)) {
          Function *callee = call->getCalledFunction();
          if (callee && !callee->isDeclaration()) {
            if (keep.insert(callee->getName().str()).second) {
              collectCallees(callee);
            }
          }
        }
      }
    }
  };
  collectCallees(F);

  for (auto it = newMod->begin(); it != newMod->end();) {
    Function &F2 = *it++;
    if (F2.isDeclaration())
      continue;
    if (keep.find(F2.getName().str()) == keep.end()) {
      if (F2.use_empty())
        F2.eraseFromParent();
      else
        F2.deleteBody();
    }
  }

  return newMod;
}

class LabeledUnrollPass : public PassInfoMixin<LabeledUnrollPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {

    auto &LI = FAM.getResult<LoopAnalysis>(F);
    auto &SE = FAM.getResult<ScalarEvolutionAnalysis>(F);

    std::vector<Loop *> loops(LI.begin(), LI.end());
    for (Loop *L : loops) {
      unsigned tripCount = SE.getSmallConstantTripCount(L);
      if (tripCount == 0) {
        errs() << "cannot determine trip count\n";
        continue;
      }

      errs() << "Loop trip count: " << tripCount << "\n";
      addLabelNUnroll(F, L, LI, SE, tripCount);
    }
    return PreservedAnalyses::none();
  }

  void addLabelNUnroll(Function &F, Loop *L, LoopInfo &LI, ScalarEvolution &SE,
                       unsigned tripCount) {
    BasicBlock *header = L->getHeader();
    BasicBlock *latch = L->getLoopLatch();
    BasicBlock *preheader = L->getLoopPreheader();
    BasicBlock *exitBB = L->getUniqueExitBlock();

    if (!header || !latch || !preheader || !exitBB) {
      errs() << "Loop not in simplified form\n";
      return;
    }

    std::vector<BasicBlock *> origBlocks;
    for (BasicBlock *BB : L->blocks()) {
      origBlocks.push_back(BB);
    }

    BasicBlock *prevIterExit = preheader;
    ValueToValueMapTy cumulativeMap;

    for (unsigned i = 0; i < tripCount; i++) {
      // 1. Create start label
      BasicBlock *iterStart = BasicBlock::Create(
          F.getContext(), "iter_" + std::to_string(i) + "_start", &F);

      // 2. Resolve PHI nodes for this iteration
      std::vector<std::pair<PHINode *, Value *>> resolvedPhis;
      for (PHINode &PN : header->phis()) {
        Value *incoming;
        if (i == 0) {
          incoming = PN.getIncomingValueForBlock(preheader);
        } else {
          Value *latchVal = PN.getIncomingValueForBlock(latch);
          if (Value *mapped = cumulativeMap.lookup(latchVal))
            incoming = mapped;
          else
            incoming = latchVal;
        }
        cumulativeMap[&PN] = incoming;
        resolvedPhis.push_back({&PN, incoming});
      }

      // 3. Clone all blocks for this iteration
      std::vector<BasicBlock *> iterationCloned;
      ValueToValueMapTy iterationBlockMap;
      for (BasicBlock *BB : origBlocks) {
        BasicBlock *cloned =
            CloneBasicBlock(BB, cumulativeMap, ".iter" + std::to_string(i), &F);
        iterationCloned.push_back(cloned);
        iterationBlockMap[BB] = cloned;

        // Map individual instructions to their clones
        auto itOrig = BB->begin();
        auto itCloned = cloned->begin();
        while (itOrig != BB->end() && itCloned != cloned->end()) {
          iterationBlockMap[&*itOrig] = &*itCloned;
          // For next iteration's use
          cumulativeMap[&*itOrig] = &*itCloned;
          itOrig++;
          itCloned++;
        }
      }

      // 4. Resolve internal control flow in the cloned iteration
      for (BasicBlock *cloned : iterationCloned) {
        for (Instruction &I : *cloned) {
          RemapInstruction(&I, iterationBlockMap,
                           RF_NoModuleLevelChanges | RF_IgnoreMissingLocals);
        }
      }

      // 5. Remove PHI nodes from the cloned header as they are now resolved
      for (auto &pair : resolvedPhis) {
        PHINode *origPhi = pair.first;
        Value *resolvedVal = pair.second;
        if (Value *clonedPhiVal = iterationBlockMap.lookup(origPhi)) {
          PHINode *clonedPhi = cast<PHINode>(clonedPhiVal);
          clonedPhi->replaceAllUsesWith(resolvedVal);
          clonedPhi->eraseFromParent();
        }
      }

      // 6. Create end label
      BasicBlock *iterEnd = BasicBlock::Create(
          F.getContext(), "iter_" + std::to_string(i) + "_end", &F);

      // 7. Connect control flow
      if (i == 0) {
        Instruction *prevTerm = preheader->getTerminator();
        BranchInst::Create(iterStart, preheader);
        prevTerm->eraseFromParent();
      } else {
        BranchInst::Create(iterStart, prevIterExit);
      }

      BranchInst::Create(iterationCloned.front(), iterStart);

      BasicBlock *clonedLatch = cast<BasicBlock>(iterationBlockMap[latch]);
      Instruction *latchTerm = clonedLatch->getTerminator();
      BranchInst::Create(iterEnd, clonedLatch);
      latchTerm->eraseFromParent();

      prevIterExit = iterEnd;
    }

    BranchInst::Create(exitBB, prevIterExit);
    for (auto it = exitBB->begin(); isa<PHINode>(it);) {
      PHINode *PN = cast<PHINode>(&*it++);
      Value *incomingVal = nullptr;

      for (unsigned j = 0; j < PN->getNumIncomingValues(); j++) {
        if (L->contains(PN->getIncomingBlock(j))) {
          incomingVal = PN->getIncomingValue(j);
          break;
        }
      }

      if (!incomingVal)
        continue;

      if (Value *mapped = cumulativeMap.lookup(incomingVal))
        incomingVal = mapped;

      while (true) {
        bool removed = false;
        for (unsigned j = 0; j < PN->getNumIncomingValues(); j++) {
          if (L->contains(PN->getIncomingBlock(j))) {
            PN->removeIncomingValue(j, false);
            removed = true;
            break;
          }
        }
        if (!removed)
          break;
      }

      PN->addIncoming(incomingVal, prevIterExit);
    }

    for (BasicBlock *BB : origBlocks) {
      BB->eraseFromParent();
    }
  }
};

int main(int argc, char **argv) {
  if (argc < 3) {
    errs() << "Usage: loopSkip <input.ll> <mode>\n";
    errs() << "0 => loopSkip\n";
    errs() << "1 => funcSkip\n";
    return 1;
  }

  std::string inputFile = argv[1];
  int mode = std::stoi(argv[2]);

  LLVMContext ctx;
  SMDiagnostic err;
  auto module = parseIRFile(inputFile, err, ctx);
  if (!module) {
    err.print("error", errs());
    return 1;
  }

  Function *target = module->getFunction("pqcrystals_kyber512_ref_indcpa_keypair_derand");
  if (!target) {
    std::cout << "Function not found" << std::endl;
    return 1;
  }

  auto funcModule = extractFunction(*module, target);
  if (!funcModule) {
    std::cout << "Failed to create extracted module" << std::endl;
    return 1;
  }

  if (Function *F = funcModule->getFunction("pqcrystals_kyber512_ref_indcpa_keypair_derand")) {
    F->setLinkage(GlobalValue::ExternalLinkage);
  }

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

  if (mode == LOOP_SKIP) {
    for (Function &F : *funcModule) {
      F.removeFnAttr(Attribute::NoInline);
      F.removeFnAttr(Attribute::OptimizeNone);

      if (!F.isDeclaration()) {
        F.addFnAttr(Attribute::InlineHint);
      }
    }
    // inline
    // {
    //   InlineParams IP;
    //   IP.DefaultThreshold = 10000;
    //   MPM.addPass(ModuleInlinerPass(IP));
    // }

    // constant-prop
    {
      FunctionPassManager FPM;
      FPM.addPass(PromotePass());
      FPM.addPass(SCCPPass());
      FPM.addPass(CorrelatedValuePropagationPass());
      FPM.addPass(InstCombinePass());
      FPM.addPass(SimplifyCFGPass());
      MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }
    {
      FunctionPassManager FPM;
      FPM.addPass(LoopSimplifyPass());
      FPM.addPass(LCSSAPass());
      FPM.addPass(createFunctionToLoopPassAdaptor(LoopRotatePass()));
      FPM.addPass(createFunctionToLoopPassAdaptor(IndVarSimplifyPass()));

      // FPM.addPass(LabeledUnrollPass());

      // FPM.addPass(InstCombinePass());
      FPM.addPass(SCCPPass());
      // FPM.addPass(SimplifyCFGPass());
      FPM.addPass(PromotePass());

      MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }
  } else if (mode == FUNC_SKIP) {
    for (Function &F : *funcModule) {
      F.removeFnAttr(Attribute::NoInline);
      F.removeFnAttr(Attribute::OptimizeNone);

      if (!F.isDeclaration()) {
        F.addFnAttr(Attribute::InlineHint);
      }
    }

    // Add prep passes to allow SE to determine trip count
    {
      FunctionPassManager FPM;
      FPM.addPass(PromotePass());
      FPM.addPass(SCCPPass());
      FPM.addPass(CorrelatedValuePropagationPass());
      FPM.addPass(InstCombinePass());
      FPM.addPass(SimplifyCFGPass());
      MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }
    {
      FunctionPassManager FPM;
      FPM.addPass(LoopSimplifyPass());
      FPM.addPass(LCSSAPass());
      FPM.addPass(createFunctionToLoopPassAdaptor(LoopRotatePass()));
      FPM.addPass(createFunctionToLoopPassAdaptor(IndVarSimplifyPass()));

      FPM.addPass(FuncSkip());

      FPM.addPass(SCCPPass());
      FPM.addPass(PromotePass());
      MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }

    // inline remaining function calls
    {
      InlineParams IP;
      IP.DefaultThreshold = 10000;
      MPM.addPass(ModuleInlinerPass(IP));
    }
    {
      // FunctionPassManager FPM;
      // // FPM.addPass(InstCombinePass());
      // FPM.addPass(SimplifyCFGPass());
      // MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }
  } else {
    errs() << "Invalid mode. Use 0 or 1\n";
    return 1;
  }
  MPM.addPass(GlobalOptPass());

  MPM.run(*funcModule, MAM);

  // Lower intrinsics and synthesize library bodies right before dumping.
  {
    FunctionPassManager FPM;
    FPM.addPass(LowerIntrinsicsPass());
    for (Function &F : *funcModule) {
      if (!F.isDeclaration()) {
        FPM.run(F, FAM);
      }
    }
    // Cleanup dead intrinsic declarations
    std::vector<Function*> toRemove;
    for (Function &F : *funcModule) {
      if (F.isIntrinsic() && F.use_empty()) {
        toRemove.push_back(&F);
      }
    }
    for (Function *F : toRemove) F->eraseFromParent();
  }
  LibraryBodies(*funcModule);

  // outs() << *funcModule;
  if (verifyModule(*funcModule, &errs())) {
    errs() << "Invalid IR\n";
    return 1;
  } else {
    outs() << "IR verified";
  }
  std::cout << "Dumping module..." << std::endl;
  if (mode == LOOP_SKIP) {
    dump_module(*funcModule, "../original.ll");

    // // --- Simulate loop-skip fault: skip iteration 1 ---
    // auto faultModule = CloneModule(*funcModule);

    // unsigned skipIter = 1;
    // Function *faultFunc = faultModule->getFunction("mat_add");
    // if (faultFunc) {
    //   std::string srcName = "iter_" + std::to_string(skipIter - 1) + "_end";
    //   std::string newTarget = "iter_" + std::to_string(skipIter + 1) + "_start";
    //   std::string skippedSuffix = ".iter" + std::to_string(skipIter);
    //   std::string prevSuffix = ".iter" + std::to_string(skipIter - 1);

    //   // Collect blocks belonging to the skipped iteration
    //   std::string skipStartName = "iter_" + std::to_string(skipIter) + "_start";
    //   std::string skipEndName = "iter_" + std::to_string(skipIter) + "_end";
    //   std::vector<BasicBlock *> skippedBlocks;
    //   BasicBlock *srcBB = nullptr, *newTargetBB = nullptr;
    //   bool inSkipped = false;

    //   for (BasicBlock &BB : *faultFunc) {
    //     if (BB.getName() == srcName)
    //       srcBB = &BB;
    //     if (BB.getName() == newTarget)
    //       newTargetBB = &BB;
    //     if (BB.getName() == skipStartName)
    //       inSkipped = true;
    //     if (inSkipped)
    //       skippedBlocks.push_back(&BB);
    //     if (BB.getName() == skipEndName)
    //       inSkipped = false;
    //   }

    //   if (srcBB && newTargetBB) {

    //     std::map<Value *, Value *> remap;
    //     for (BasicBlock *BB : skippedBlocks) {
    //       for (Instruction &I : *BB) {
    //         std::string iName = I.getName().str();
    //         if (iName.empty())
    //           continue;

    //         // Check if this instruction's name ends with the skipped suffix
    //         size_t pos = iName.rfind(skippedSuffix);
    //         if (pos == std::string::npos)
    //           continue;

    //         // Build the corresponding previous-iteration name
    //         std::string prevName = iName.substr(0, pos) + prevSuffix;

    //         // Find the instruction with that name in the function
    //         for (BasicBlock &searchBB : *faultFunc) {
    //           for (Instruction &searchI : searchBB) {
    //             if (searchI.getName() == prevName) {
    //               remap[&I] = &searchI;
    //               break;
    //             }
    //           }
    //           if (remap.count(&I))
    //             break;
    //         }
    //       }
    //     }

    //     // Replace uses of skipped-iteration values in non-skipped blocks
    //     for (auto &[skippedVal, prevVal] : remap) {
    //       std::vector<Use *> usesToReplace;
    //       for (Use &U : skippedVal->uses()) {
    //         Instruction *user = dyn_cast<Instruction>(U.getUser());
    //         if (!user)
    //           continue;
    //         // Only replace uses outside the skipped blocks
    //         BasicBlock *userBB = user->getParent();
    //         bool isInSkipped = false;
    //         for (BasicBlock *sBB : skippedBlocks) {
    //           if (sBB == userBB) {
    //             isInSkipped = true;
    //             break;
    //           }
    //         }
    //         if (!isInSkipped) {
    //           usesToReplace.push_back(&U);
    //         }
    //       }
    //       for (Use *U : usesToReplace) {
    //         U->set(prevVal);
    //       }
    //     }

    //     // Redirect the branch
    //     Instruction *term = srcBB->getTerminator();
    //     if (auto *br = dyn_cast<BranchInst>(term)) {
    //       BranchInst::Create(newTargetBB, srcBB);
    //       br->eraseFromParent();
    //       outs() << "Fault injected: " << srcName << " -> " << newTarget
    //              << " (skipping iteration " << skipIter << ")\n";
    //     }
    //     for (BasicBlock *BB : skippedBlocks) {
    //       BB->dropAllReferences();
    //     }
    //     // *** THEN erase (safe now that no intra-dead-block uses remain) ***
    //     for (BasicBlock *BB : skippedBlocks) {
    //       BB->eraseFromParent();
    //     }
    //   } else {
    //     errs() << "Could not find blocks for fault injection\n";
    //   }
    // }

    // if (verifyModule(*faultModule, &errs())) {
    //   errs() << "Fault module has invalid IR\n";
    // } else {
    //   dump_module(*faultModule, "../loopSkip.ll");
    //   outs() << "Wrote ../loopSkip.ll\n";
    // }
  } else {
    dump_module(*funcModule, "../funcSkip.ll");
  }

  run_command("../llvmbmc ../original.ll --dump-solver-query -f pqcrystals_kyber512_ref_indcpa_keypair_derand --var-suffix correct");
  // run_command("cp /tmp/test.smt2 ../correct.smt2");
  // if (mode == LOOP_SKIP) {
  //   run_command("../llvmbmc ../loopSkip.ll --dump-solver-query -f mat_add --var-suffix faulty");
  //   run_command("cp /tmp/test.smt2 ../loopFault.smt2");
  // } else {
  //   run_command("../llvmbmc ../funcSkip.ll --dump-solver-query -f mat_add --var-suffix faulty");
  //   run_command("cp /tmp/test.smt2 ../funcSkip.smt2");
  // }

  return 0;
}