#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Transforms/IPO/GlobalDCE.h"
#include "llvm/Transforms/IPO/GlobalOpt.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar/ADCE.h"
#include "llvm/Transforms/Scalar/CorrelatedValuePropagation.h"
#include "llvm/Transforms/Scalar/DCE.h"
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
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <array>
#include <cstdio>
#include <cstdlib>
#include <iostream>

#include "json_parser.h"
#include <memory>

using namespace llvm;
void run_command(const std::string &cmd) {
  int ret = system(cmd.c_str());
  if (ret != 0) {
    std::cerr << "Command failed!\n";
    exit(1);
  }
}

std::string run_command_capture(const std::string &cmd, int &exitCode) {
  std::string fullCmd = cmd + " 2>&1";
  FILE *pipe = popen(fullCmd.c_str(), "r");
  if (!pipe) {
    exitCode = -1;
    return "file open failed";
  }
  std::string output;
  std::array<char, 256> buf;
  while (fgets(buf.data(), buf.size(), pipe)) {
    output += buf.data();
  }
  int status = pclose(pipe);
  exitCode = WIFEXITED(status) ? WEXITSTATUS(status) : -1;
  return output;
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
      BasicBlock *iterStart = BasicBlock::Create(
          F.getContext(), "iter_" + std::to_string(i) + "_start", &F);

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

      std::vector<BasicBlock *> iterationCloned;
      ValueToValueMapTy iterationBlockMap;
      for (BasicBlock *BB : origBlocks) {
        BasicBlock *cloned =
            CloneBasicBlock(BB, cumulativeMap, ".iter" + std::to_string(i), &F);
        iterationCloned.push_back(cloned);
        iterationBlockMap[BB] = cloned;

        auto itOrig = BB->begin();
        auto itCloned = cloned->begin();
        while (itOrig != BB->end() && itCloned != cloned->end()) {
          iterationBlockMap[&*itOrig] = &*itCloned;
          cumulativeMap[&*itOrig] = &*itCloned;
          itOrig++;
          itCloned++;
        }
      }

      for (BasicBlock *cloned : iterationCloned) {
        for (Instruction &I : *cloned) {
          RemapInstruction(&I, iterationBlockMap,
                           RF_NoModuleLevelChanges | RF_IgnoreMissingLocals);
        }
      }

      for (auto &pair : resolvedPhis) {
        PHINode *origPhi = pair.first;
        Value *resolvedVal = pair.second;
        if (Value *clonedPhiVal = iterationBlockMap.lookup(origPhi)) {
          PHINode *clonedPhi = cast<PHINode>(clonedPhiVal);
          clonedPhi->replaceAllUsesWith(resolvedVal);
          clonedPhi->eraseFromParent();
        }
      }

      BasicBlock *iterEnd = BasicBlock::Create(
          F.getContext(), "iter_" + std::to_string(i) + "_end", &F);

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

/// Trace a value backwards to its original AllocaInst, GlobalVariable, or
/// Constant.
Value *traceArgToRoot(Value *V) {
  std::set<Value *> visited;
  while (V && visited.insert(V).second) {
    if (auto *GEP = dyn_cast<GetElementPtrInst>(V)) {
      V = GEP->getPointerOperand();
    } else if (auto *BC = dyn_cast<BitCastInst>(V)) {
      V = BC->getOperand(0);
    } else if (auto *Arg = dyn_cast<Argument>(V)) {
      Function *F = Arg->getParent();
      bool foundCall = false;
      for (User *U : F->users()) {
        if (auto *CB = dyn_cast<CallBase>(U)) {
          if (CB->getCalledFunction() == F) {
            V = CB->getArgOperand(Arg->getArgNo());
            foundCall = true;
            break; // Just pick the first call site
          }
        }
      }
      if (!foundCall)
        break;
    } else if (auto *LI = dyn_cast<LoadInst>(V)) {
      break;
    } else {
      break;
    }
  }
  return V;
}

unsigned inferPointerAllocSize(Argument *arg, unsigned defaultSize) {
  unsigned maxOffset = 0;
  bool foundGEP = false;

  std::function<void(Value *)> scanUsers = [&](Value *V) {
    for (User *U : V->users()) {
      if (auto *GEP = dyn_cast<GetElementPtrInst>(U)) {
        APInt offset(32, 0);
        if (GEP->accumulateConstantOffset(GEP->getModule()->getDataLayout(),
                                          offset)) {
          unsigned off = (unsigned)offset.getZExtValue();
          unsigned accessSize = off + 1;
          for (User *GU : GEP->users()) {
            if (auto *LI = dyn_cast<LoadInst>(GU)) {
              unsigned elemBytes =
                  LI->getModule()->getDataLayout().getTypeStoreSize(
                      LI->getType());
              accessSize = off + elemBytes;
            } else if (auto *SI = dyn_cast<StoreInst>(GU)) {
              if (SI->getPointerOperand() == GEP) {
                unsigned elemBytes =
                    SI->getModule()->getDataLayout().getTypeStoreSize(
                        SI->getValueOperand()->getType());
                accessSize = off + elemBytes;
              }
            }
          }
          if (accessSize > maxOffset) {
            maxOffset = accessSize;
            foundGEP = true;
          }
        }
        scanUsers(GEP);
      } else if (auto *BC = dyn_cast<BitCastInst>(U)) {
        scanUsers(BC);
      }
    }
  };

  scanUsers(arg);
  return foundGEP ? maxOffset : defaultSize;
}

static void emitAssert(IRBuilder<> &builder, LLVMContext &ctx, Value *cond,
                       Function *parentFn) {
  Module *M = parentFn->getParent();

  // Get or declare: void _Z6assertb(i1 noundef zeroext)
  const char *AssertName = "_Z6assertb";
  Function *AssertFn = M->getFunction(AssertName);
  if (!AssertFn) {
    FunctionType *AssertTy =
        FunctionType::get(Type::getVoidTy(ctx), {Type::getInt1Ty(ctx)}, false);
    AssertFn =
        Function::Create(AssertTy, GlobalValue::ExternalLinkage, AssertName, M);
    AssertFn->addParamAttr(0, Attribute::NoUndef);
    AssertFn->addParamAttr(0, Attribute::ZExt);
  }

  CallInst *call = builder.CreateCall(AssertFn, {cond});
  call->addParamAttr(0, Attribute::NoUndef);
  call->addParamAttr(0, Attribute::ZExt);
}

static void zeroFillThenStoreU64(IRBuilder<> &builder, LLVMContext &ctx,
                                 Value *basePtr, uint64_t allocSize,
                                 bool haveVal, uint64_t val) {
  builder.CreateMemSet(basePtr, builder.getInt8(0), allocSize, Align(1));
  if (!haveVal || allocSize == 0)
    return;

  unsigned numBytes = (unsigned)std::min<uint64_t>(allocSize, 8);
  Type *i8Ty = Type::getInt8Ty(ctx);

  for (unsigned i = 0; i < numBytes; i++) {
    uint8_t byteVal = (uint8_t)((val >> (i * 8)) & 0xFF);
    if (byteVal == 0)
      continue; // buffer is already zeroed by the memset above

    Value *bytePtr = builder.CreateInBoundsGEP(
        i8Ty, basePtr, builder.getInt32(i), "byte" + std::to_string(i));
    builder.CreateStore(builder.getInt8(byteVal), bytePtr);
  }
}

void createDynamicDriverFunction(Module &OriginalM, Module &ExtractedM,
                                 Function *TargetF,
                                 const JsonObject &testcase) {
  LLVMContext &ctx = ExtractedM.getContext();

  FunctionType *driverTy = FunctionType::get(Type::getInt32Ty(ctx), false);
  Function *driver = Function::Create(driverTy, GlobalValue::ExternalLinkage,
                                      "main", &ExtractedM);

  BasicBlock *entry = BasicBlock::Create(ctx, "entry", driver);
  IRBuilder<> builder(entry);

  std::vector<Value *> callArgs;
  std::vector<Value *> argPtrsByPos(TargetF->arg_size(), nullptr);
  std::vector<uint64_t> argAllocSizeByPos(TargetF->arg_size(), 0);

  std::vector<const JsonValue *> positionalVals;
  for (auto &kv : testcase) {
    if (kv.first == "output")
      continue;
    positionalVals.push_back(&kv.second);
  }

  if (positionalVals.size() != TargetF->arg_size()) {
    errs() << "Warning: testcase has " << positionalVals.size()
           << " positional values but " << TargetF->getName() << " has "
           << TargetF->arg_size() << " arguments. "
           << "Extra/missing args will fall back to zero.\n";
  }

  int outputArgPos = -1;
  if (jsonHas(testcase, "output")) {
    const JsonValue &outVal = jsonGet(testcase, "output");
    if (outVal.isString) {
      int pos = 0;
      for (auto &kv : testcase) {
        if (kv.first == "output")
          continue;
        if (kv.first == outVal.strVal) {
          outputArgPos = pos;
          break;
        }
        pos++;
      }
    }
  }

  Function *OrigF = OriginalM.getFunction(TargetF->getName());
  CallBase *FirstCall = nullptr;
  if (OrigF) {
    for (User *U : OrigF->users()) {
      if (auto *CB = dyn_cast<CallBase>(U)) {
        if (CB->getCalledFunction() == OrigF) {
          FirstCall = CB;
          break;
        }
      }
    }
  }

  for (unsigned i = 0; i < TargetF->arg_size(); i++) {
    Argument *arg = TargetF->getArg(i);
    Type *argTy = arg->getType();

    Value *root = nullptr;
    if (FirstCall) {
      root = traceArgToRoot(FirstCall->getArgOperand(i));
    }

    bool haveJsonVal =
        i < positionalVals.size() && !positionalVals[i]->isString;
    uint64_t jsonVal = haveJsonVal ? positionalVals[i]->asUInt64() : 0;
    bool isOutputArg = ((int)i == outputArgPos);
    bool doStore = haveJsonVal && !isOutputArg;

    if (argTy->isPointerTy()) {
      Value *ptr = nullptr;
      uint64_t allocSize = 0;
      if (root) {
        if (auto *AI = dyn_cast<AllocaInst>(root)) {
          Type *allocTy = AI->getAllocatedType();
          std::string name = AI->getName().str();
          MDNode *N = MDNode::get(ctx, MDString::get(ctx, name));
          if (name.empty())
            name = "buf";
          AllocaInst *newAlloc = builder.CreateAlloca(allocTy, nullptr, name);
          newAlloc->setAlignment(Align(16));
          newAlloc->setMetadata("llvmbmc.var", N);
          allocSize = ExtractedM.getDataLayout().getTypeAllocSize(allocTy);

          zeroFillThenStoreU64(builder, ctx, newAlloc, allocSize, doStore,
                               jsonVal);

          // uint8_t fillByte =
          //     haveJsonVal ? (uint8_t)(jsonVal & 0xFF) : (uint8_t)0;
          // builder.CreateMemSet(newAlloc, builder.getInt8(fillByte),
          // allocSize,
          //                      Align(1));

          ptr = builder.CreateBitCast(newAlloc, argTy);
          errs() << "  Arg " << i << " (" << arg->getName()
                 << "): alloca of type " << *allocTy << " named " << name
                 << "\n";
        } else if (auto *GV = dyn_cast<GlobalVariable>(root)) {
          Type *valTy = GV->getValueType();
          std::string name = GV->getName().str();
          MDNode *N = MDNode::get(ctx, MDString::get(ctx, name));
          if (name.empty())
            name = "buf";
          AllocaInst *newAlloc = builder.CreateAlloca(valTy, nullptr, name);
          newAlloc->setAlignment(Align(16));
          newAlloc->setMetadata("llvmbmc.var", N);
          allocSize = ExtractedM.getDataLayout().getTypeAllocSize(valTy);
          zeroFillThenStoreU64(builder, ctx, newAlloc, allocSize, doStore,
                               jsonVal);
          // uint8_t fillByte =
          //     haveJsonVal ? (uint8_t)(jsonVal & 0xFF) : (uint8_t)0;
          // builder.CreateMemSet(newAlloc, builder.getInt8(fillByte),
          // allocSize,
          //                      Align(1));

          ptr = builder.CreateBitCast(newAlloc, argTy);
          errs() << "  Arg " << i << " (" << arg->getName()
                 << "): global of type " << *valTy << " named " << name << "\n";
        }
      }

      if (!ptr) {
        unsigned fallbackSize = inferPointerAllocSize(arg, 128);
        // unsigned allocSize = inferPointerAllocSize(arg, 128);
        ArrayType *arrTy = ArrayType::get(Type::getInt8Ty(ctx), fallbackSize);
        AllocaInst *alloc =
            builder.CreateAlloca(arrTy, nullptr, arg->getName() + "_buf");
        MDNode *N = MDNode::get(ctx, MDString::get(ctx, alloc->getName()));
        alloc->setAlignment(Align(16));
        alloc->setMetadata("llvmbmc.var", N);
        allocSize = fallbackSize;

        zeroFillThenStoreU64(builder, ctx, alloc, fallbackSize, doStore,
                             jsonVal);
        // uint8_t fillByte = haveJsonVal ? (uint8_t)(jsonVal & 0xFF) :
        // (uint8_t)0; builder.CreateMemSet(alloc, builder.getInt8(fillByte),
        // fallbackSize,
        //                      Align(1));

        ptr = builder.CreateBitCast(alloc, argTy);
        errs() << "  Arg " << i << " (" << arg->getName()
               << "): fallback -> alloca [" << allocSize << " x i8]\n";
      }
      callArgs.push_back(ptr);
      argPtrsByPos[i] = ptr;
      argAllocSizeByPos[i] = allocSize;

    } else if (argTy->isIntegerTy()) {
      if (haveJsonVal) {
        callArgs.push_back(ConstantInt::get(argTy, jsonVal));
        errs() << "  Arg " << i << " (" << arg->getName()
               << "): testcase value " << jsonVal << "\n";
      } else if (root && isa<ConstantInt>(root)) {
        ConstantInt *CI = cast<ConstantInt>(root);
        callArgs.push_back(ConstantInt::get(argTy, CI->getZExtValue()));
        errs() << "  Arg " << i << " (" << arg->getName() << "): constant "
               << CI->getZExtValue() << "\n";
      } else {
        callArgs.push_back(ConstantInt::get(argTy, 0));
        errs() << "  Arg " << i << " (" << arg->getName() << "): default 0\n";
      }
    } else {
      callArgs.push_back(Constant::getNullValue(argTy));
      errs() << "  Arg " << i << " (" << arg->getName()
             << "): unknown type -> null\n";
    }
  }

  CallInst *callI = builder.CreateCall(TargetF, callArgs);
  callI->setCallingConv(TargetF->getCallingConv());

  // Output assertion
  if (jsonHas(testcase, "output")) {
    const JsonValue &outVal = jsonGet(testcase, "output");
    if (outVal.isString) {
      std::string outKeyName = outVal.strVal;
      if (outKeyName == "ret") {

        if (positionalVals.empty()) {
          errs() << "  Warning: 'ret' output requested but testcase has no "
                    "positional values\n";
        } else if (TargetF->getReturnType()->isVoidTy()) {
          errs() << "  Warning: 'ret' output requested but function has "
                    "void return type\n";
        } else if (!TargetF->getReturnType()->isIntegerTy()) {
          errs() << "  Warning: 'ret' output requested but return type is "
                    "not an integer\n";
        } else {
          long long expected = positionalVals.back()->asUInt64();
          Type *retTy = TargetF->getReturnType();
          Value *expectedC = ConstantInt::get(retTy, expected);
          Value *cmp = builder.CreateICmpEQ(callI, expectedC, "out_cmp");

          emitAssert(builder, ctx, cmp, driver);
          errs() << "  Inserted output assertion: return value == " << expected
                 << "\n";
        }
      } else {

        int outPos = -1;
        long long expected = 0;
        bool foundExpected = false;
        int pos = 0;
        for (auto &kv : testcase) {
          if (kv.first == "output")
            continue;
          if (kv.first == outKeyName) {
            outPos = pos;
            expected = kv.second.asUInt64();
            foundExpected = true;
          }
          pos++;
        }

        if (outPos >= 0 && foundExpected &&
            (size_t)outPos < argPtrsByPos.size() && argPtrsByPos[outPos]) {
          Value *outPtr = argPtrsByPos[outPos];
          uint64_t outAllocSize = argAllocSizeByPos[outPos];

          Value *cmp = nullptr;
          if (outAllocSize >= 8) {
            Value *i8Ptr = builder.CreateBitCast(
                outPtr, PointerType::getUnqual(Type::getInt8Ty(ctx)));
            Value *actual = builder.CreateLoad(Type::getInt8Ty(ctx), i8Ptr,
                                               "out_actual_i8");
            Value *expectedC = ConstantInt::get(Type::getInt8Ty(ctx), expected);
            cmp = builder.CreateICmpEQ(actual, expectedC, "out_cmp");
          } else if (outAllocSize > 0) {
            Type *narrowTy = Type::getIntNTy(ctx, (unsigned)outAllocSize * 8);
            Value *narrowPtr =
                builder.CreateBitCast(outPtr, PointerType::getUnqual(narrowTy));
            Value *actual =
                builder.CreateLoad(narrowTy, narrowPtr, "out_actual_narrow");
            Value *expectedC = ConstantInt::get(narrowTy, expected);
            cmp = builder.CreateICmpEQ(actual, expectedC, "out_cmp");
          }

          if (cmp) {
            emitAssert(builder, ctx, cmp, driver);
            errs() << "  Inserted output assertion: arg" << outPos << " ("
                   << outKeyName << ") i64[0] == " << expected << "\n";
          } else {
            errs() << "  Warning: output buffer for '" << outKeyName
                   << "' has zero size, skipping assertion\n";
          }
        } else {
          errs() << "  Warning: could not resolve output assertion for '"
                 << outKeyName << "' (bad position or non-pointer arg)\n";
        }
      }
    }
  }
  builder.CreateRet(builder.getInt32(0));

  // Prevent the driver from being optimized away or inlined
  driver->addFnAttr(Attribute::NoInline);
  driver->addFnAttr(Attribute::OptimizeNone);

  errs() << "Created driver function for " << TargetF->getName() << "\n";
}

enum class FaultModel { Undef, Zero, OpB, OpC, Mem };
static Instruction *getInstByIndex(Function &F, unsigned targetInst) {
  unsigned idx = 0;
  for (BasicBlock &BB : F) {
    for (Instruction &I : BB) {
      if (idx == targetInst)
        return &I;
      ++idx;
    }
  }
  return nullptr;
}

struct InstLocator {
  bool hasDbg = false;
  unsigned dbgLine = 0;
  unsigned dbgCol = 0;
  unsigned fallbackIndex = 0; // used only if no debug info is available
};

static InstLocator captureInstLocator(Instruction *I, unsigned idxInFunction) {
  InstLocator loc;
  loc.fallbackIndex = idxInFunction;
  if (DebugLoc DL = I->getDebugLoc()) {
    loc.hasDbg = true;
    loc.dbgLine = DL.getLine();
    loc.dbgCol = DL.getCol();
  }
  return loc;
}

static bool isFirstIterationBlock(const BasicBlock &BB) {
  StringRef name = BB.getName();
  if (name == "iter_0_start" || name == "iter_0_end")
    return true;
  if (name.ends_with(".iter0"))
    return true;
  return false;
}

static Instruction *findInstByLocator(Function &F, const InstLocator &loc) {
  if (loc.hasDbg) {
    Instruction *firstIterMatch = nullptr;
    Instruction *anyMatch = nullptr;

    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        DebugLoc DL = I.getDebugLoc();
        if (!DL || DL.getLine() != loc.dbgLine || DL.getCol() != loc.dbgCol)
          continue;

        if (!anyMatch)
          anyMatch = &I;
        if (!firstIterMatch && isFirstIterationBlock(BB))
          firstIterMatch = &I;
      }
    }

    if (firstIterMatch)
      return firstIterMatch;

    if (anyMatch) {
      return anyMatch;
    }
    errs() << "Warning: no instruction with debug loc " << loc.dbgLine << ":"
           << loc.dbgCol << " found; falling back to index "
           << loc.fallbackIndex << "\n";
  }
  return getInstByIndex(F, loc.fallbackIndex);
}

class FaultInjectionPass : public PassInfoMixin<FaultInjectionPass> {
  FaultModel FM;
  InstLocator loc;
  static std::string valueName(Value *V) {
    if (V->hasName())
      return "%" + V->getName().str();
    std::string s;
    raw_string_ostream os(s);
    V->printAsOperand(os, false);
    return os.str();
  }

  static Instruction *getInst(Function &F, unsigned targetInst) {
    unsigned idx = 0;

    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        if (idx == targetInst)
          return &I;
        ++idx;
      }
    }

    return nullptr;
  }

public:
  explicit FaultInjectionPass(FaultModel FM, InstLocator loc)
      : FM(FM), loc(loc) {}

  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {

    bool modified = false;

    Instruction *I = findInstByLocator(F, loc);
    // outs() << *I;
    if (!I) {
      errs() << "No instruction found for locator\n";
      // errs() << M;
      return PreservedAnalyses::all();
    }
    if (auto *binOp = dyn_cast<BinaryOperator>(I)) {

      Type *ty = binOp->getType();

      Value *faulty = nullptr;

      switch (FM) {
      case FaultModel::Undef:
        faulty = UndefValue::get(ty);
        binOp->replaceAllUsesWith(faulty);
        binOp->eraseFromParent();
        modified = true;
        break;
      case FaultModel::Zero:
        faulty = ConstantInt::get(ty, 0);
        binOp->replaceAllUsesWith(faulty);
        binOp->eraseFromParent();
        modified = true;
        break;
      case FaultModel::OpB:
        binOp->setOperand(0, ConstantInt::get(ty, 0));
        modified = true;
        break;
      case FaultModel::OpC:
        binOp->setOperand(1, ConstantInt::get(ty, 0));
        modified = true;
        break;
      case FaultModel::Mem:
        break;
      }
    } else if (auto *load = dyn_cast<LoadInst>(I)) {
      if (FM == FaultModel::Mem) {
        Type *ty = load->getType();
        Value *faulty = Constant::getNullValue(ty);
        load->replaceAllUsesWith(faulty);
        load->eraseFromParent();
        modified = true;
      }
    } else if (auto *store = dyn_cast<StoreInst>(I)) {
      if (FM == FaultModel::Mem) {
        store->eraseFromParent();
        modified = true;
      }
    }

    if (modified)
      return PreservedAnalyses::none();
    else
      return PreservedAnalyses::all();
  }
};

void dump_module(llvm::Module &M, const std::string &filename) {
  // Create parent directories.
  SmallString<256> path(filename);
  sys::path::remove_filename(path);

  if (!path.empty()) {
    if (std::error_code EC = llvm::sys::fs::create_directories(path)) {
      llvm::errs() << "Failed to create directories: " << EC.message() << "\n";
      return;
    }
  }

  std::error_code EC;
  llvm::raw_fd_ostream out(filename, EC);

  if (EC) {
    llvm::errs() << "Failed to open file '" << filename << "': " << EC.message()
                 << "\n";
    return;
  }

  M.print(out, nullptr);
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

Function *getOrCloneHelper(Module &M, Module &SourceM, StringRef Name) {

  if (Function *F = M.getFunction(Name))
    return F;

  Function *Src = SourceM.getFunction(Name);
  if (!Src)
    return nullptr;

  ValueToValueMapTy VMap;

  Function *NewF = Function::Create(Src->getFunctionType(), Src->getLinkage(),
                                    Src->getName(), &M);

  auto DestI = NewF->arg_begin();
  for (const Argument &Arg : Src->args()) {
    DestI->setName(Arg.getName());
    VMap[&Arg] = &*DestI++;
  }

  SmallVector<ReturnInst *, 8> Returns;

  CloneFunctionInto(NewF, Src, VMap, CloneFunctionChangeType::DifferentModule,
                    Returns);

  return NewF;
}

void replaceMemoryIntrinsics(Module &M, Module &SourceM) {

  Function *MayoMemset = getOrCloneHelper(M, SourceM, "mayo_memset");

  Function *MayoMemcpy = getOrCloneHelper(M, SourceM, "mayo_memcpy");

  SmallVector<CallInst *, 64> Worklist;

  for (Function &F : M) {
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {

        auto *CI = dyn_cast<CallInst>(&I);
        if (!CI)
          continue;

        Function *Callee = CI->getCalledFunction();

        if (!Callee || !Callee->isIntrinsic())
          continue;

        Intrinsic::ID ID = Callee->getIntrinsicID();

        if (ID == Intrinsic::memset || ID == Intrinsic::memcpy)
          Worklist.push_back(CI);
      }
    }
  }

  for (CallInst *CI : Worklist) {

    IRBuilder<> B(CI);

    Function *Callee = CI->getCalledFunction();

    switch (Callee->getIntrinsicID()) {

    case Intrinsic::memset: {

      auto *MSI = cast<MemSetInst>(CI);

      B.CreateCall(MayoMemset,
                   {MSI->getDest(), MSI->getValue(),
                    B.CreateIntCast(MSI->getLength(),
                                    Type::getInt32Ty(M.getContext()), false)});

      CI->eraseFromParent();
      break;
    }

    case Intrinsic::memcpy: {

      auto *MCI = cast<MemCpyInst>(CI);

      B.CreateCall(MayoMemcpy,
                   {MCI->getDest(), MCI->getSource(),
                    B.CreateIntCast(MCI->getLength(),
                                    Type::getInt32Ty(M.getContext()), false)});

      CI->eraseFromParent();
      break;
    }

    default:
      break;
    }
  }
}
void stripOutputAssertions(Module &M) {
  const char *AssertName = "_Z6assertb";
  Function *AssertFn = M.getFunction(AssertName);
  if (!AssertFn)
    return;

  SmallVector<CallInst *, 8> ToErase;
  for (User *U : AssertFn->users()) {
    if (auto *CI = dyn_cast<CallInst>(U)) {
      if (CI->getCalledFunction() == AssertFn)
        ToErase.push_back(CI);
    }
  }
  for (CallInst *CI : ToErase)
    CI->eraseFromParent();

  if (AssertFn->use_empty())
    AssertFn->eraseFromParent();
}
void cleanup(Module &M) {
  for (auto FI = M.begin(); FI != M.end();) {

    Function &F = *FI++;

    if (F.isDeclaration() && F.use_empty())
      F.eraseFromParent();
  }
  for (auto GI = M.global_begin(); GI != M.global_end();) {
    GlobalVariable *GV = &*GI++;
    if (GV->use_empty())
      GV->eraseFromParent();
  }
}

int main(int argc, char **argv) {

  if (argc < 4) {
    std::cerr << "Usage: ./binOpFault <input.ll> <function> <line>\n";
    return 1;
  }

  std::string inputFile = argv[1];
  std::string funcName = argv[2];
  int line = atoi(argv[3]);
  LLVMContext ctx;
  SMDiagnostic err;

  auto module = parseIRFile(inputFile, err, ctx);
  if (!module) {
    err.print("error", errs());
    return 1;
  }

  Function *target = module->getFunction(funcName);
  if (!target) {
    errs() << "Function  not found in input module\n";
    errs() << "Available functions:\n";
    for (Function &F : *module) {
      errs() << "  " << F.getName() << (F.isDeclaration() ? " [decl]" : "")
             << "\n";
    }
    return 1;
  }

  auto funcModule = extractFunction(*module, target);
  if (!funcModule) {
    errs() << "Failed to create extracted module\n";
    return 1;
  }
  if (Function *F = funcModule->getFunction(funcName))
    F->setLinkage(GlobalValue::ExternalLinkage);
  {
    Function *extractedFunc = funcModule->getFunction(funcName);
    if (extractedFunc) {
      errs() << "Creating driver function for " << funcName << "...\n";
      std::string jsonPath = "../../function_inputs/" + funcName + ".json";
      JsonObject testcase;
      bool haveTestcase = false;

      try {
        std::vector<JsonObject> testcases = readJsonLines(jsonPath);
        if (!testcases.empty()) {
          testcase = testcases.front();
          haveTestcase = true;
        } else {
          errs() << "No testcases found in " << jsonPath
                 << "; defaulting all arguments to zero.\n";
        }
      } catch (const std::exception &e) {
        errs() << "Warning: could not load testcases from " << jsonPath << " ("
               << e.what() << "); defaulting all arguments to zero.\n";
      }

      if (!haveTestcase) {
        errs() << "  Using zero-initialized arguments for " << funcName << "\n";
      }
      createDynamicDriverFunction(*module, *funcModule, extractedFunc,
                                  testcase);
    }
  }

  Function *preOptF = funcModule->getFunction(funcName);
  if (!preOptF) {
    errs() << "Function not found in extracted module: " << funcName << "\n";
    return 1;
  }
  Instruction *origInst = getInstByIndex(*preOptF, line);
  if (!origInst) {
    errs() << "No instruction found at line " << line
           << " in extracted (pre-optimization) function\n";
    return 1;
  }
  // Decide the fault category from the ORIGINAL instruction, before any
  // transformation can change its opcode or position.
  bool isBinOp = isa<BinaryOperator>(origInst);
  bool isLoadOrStore = isa<LoadInst>(origInst) || isa<StoreInst>(origInst);

  if (!isBinOp && !isLoadOrStore) {
    errs() << "Instruction at line " << line
           << " is neither BinOp, LoadInst, nor StoreInst ("
           << origInst->getOpcodeName() << "); skipping fault injection\n";
    return 0;
  }

  InstLocator locator = captureInstLocator(origInst, line);
  if (!locator.hasDbg) {
    errs() << "Warning: instruction at line " << line
           << " has no debug location; post-optimization re-lookup will "
              "fall back to raw index and may be unreliable.\n";
  }

  // outs() << *funcModule;
  auto makePB = [&](Module &M, auto buildPipeline) {
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
    buildPipeline(MPM);
    MPM.run(M, MAM);
  };

  for (Function &F : *funcModule) {
    F.removeFnAttr(Attribute::NoInline);
    F.removeFnAttr(Attribute::OptimizeNone);
    if (!F.isDeclaration())
      F.addFnAttr(Attribute::InlineHint);
  }

  makePB(*funcModule, [](ModulePassManager &MPM) {
    {
      InlineParams IP;
      IP.DefaultThreshold = 10000;
      MPM.addPass(ModuleInlinerPass(IP));
    }
    // Constant-prop + simplify
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
      FPM.addPass(LabeledUnrollPass());
      FPM.addPass(SCCPPass());
      FPM.addPass(PromotePass());
      MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }
    MPM.addPass(GlobalOptPass());
  });
  replaceMemoryIntrinsics(*funcModule, *module);
  cleanup(*funcModule);
  {
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

    MPM.addPass(GlobalDCEPass());

    FunctionPassManager FPM;
    FPM.addPass(ADCEPass());
    FPM.addPass(DCEPass());

    MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));

    MPM.run(*funcModule, MAM);
  }
  // StripDebugInfo(*funcModule);
  // outs() << *funcModule;
  if (verifyModule(*funcModule, &errs())) {
    errs() << "Invalid IR\n";
    return 1;
  }
  std::string filename = "../../results/" + funcName + "/";
  // std::string filename = "../results/" + funcName + ".ll";
  dump_module(*funcModule, filename + funcName + ".ll");
  outs() << "Wrote" << filename << funcName << "\n";
  std::string bmcCmdCorrect = "../llvmbmc " + filename + funcName + ".ll" +
                              " --dump-solver-query "
                              "-f main --var-suffix correct ";
  // run_command(bmcCmdCorrect);
  // run_command("cp /tmp/test.smt2 " + filename + funcName + ".smt2");

  // auto mod = parseIRFile("original.ll", err, ctx);
  // outs() << *funcModule;

  // run_command("../../llvmbmc ../original.ll --dump-solver-query -f main");
  // run_command("cp /tmp/test.smt2 ../correct.smt2");
  struct FaultEntry {
    FaultModel model;
    const char *name;
  };

  std::vector<FaultEntry> faults;
  std::string faultSubdir;
  if (isBinOp) {
    faults = {
        {FaultModel::Undef, "undef"},
        {FaultModel::Zero, "zero"},
        {FaultModel::OpB, "opB"},
        {FaultModel::OpC, "opC"},
    };
    faultSubdir = "binOpFault/";
  } else { // isLoadOrStore
    faults = {
        {FaultModel::Mem, "mem"},
    };
    faultSubdir = "loadStoreSkip/";
  }
  for (auto &fe : faults) {

    auto cloned = CloneModule(*funcModule);
    stripOutputAssertions(*cloned); 
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

    FunctionPassManager FPM;
    FPM.addPass(PromotePass());
    FPM.addPass(FaultInjectionPass(fe.model, locator));
    Function *TargetF = cloned->getFunction(funcName);

    if (!TargetF) {
      errs() << "Function not found: " << funcName << "\n";
      continue;
    }

    FPM.run(*TargetF, FAM);

    std::string llFile = filename + faultSubdir + funcName + "_line" + argv[3] +
                         "_" + fe.name + ".ll";
    std::string smt2File = filename + faultSubdir + funcName + "_line" +
                           argv[3] + "_" + fe.name + ".smt2";

    dump_module(*cloned, llFile);
    outs() << "Wrote " << llFile << "\n";
    std::string bmcCmdFaulty = "../llvmbmc " + llFile +
                               " --smt-only "

                               "-f main --var-suffix faulty ";
    // run_command(bmcCmdFaulty);
    // run_command("cp /tmp/test.smt2 " + smt2File);

  }

  return 0;
}