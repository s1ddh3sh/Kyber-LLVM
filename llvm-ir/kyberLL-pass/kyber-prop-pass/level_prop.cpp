// #include "z3++.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"

#include <llvm-20/llvm/Support/Casting.h>
#include <llvm-20/llvm/Support/raw_ostream.h>
#include <map>
#include <set>
#include <vector>

using namespace llvm;
using namespace std;

enum class Level { Public = 0, EphSecret = 1, Secret = 2 };

Level join(Level a, Level b) { return (Level)max((int)a, (int)b); }

struct Env {
  map<Value *, Level> reg;
  map<Value *, Level> mem;
  Level returnlevel = Level::Public;
};

class LevelPropPass : public PassInfoMixin<LevelPropPass> {
  map<Function *, Level> funcLevel;
  vector<Function *> callStack;

public:
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    Function *main = M.getFunction("main");

    Env global;
    analyzeFunc(main, global);
    printMaps();
    return PreservedAnalyses::all();
  }

private:
  void printMaps() {
    outs() << "\n Function Sensitivity \n";

    for (auto &it : funcLevel) {
      outs() << it.first->getName() << " -> ";

      if (it.second == Level::Public)
        outs() << "Public";
      else if (it.second == Level::EphSecret)
        outs() << "EphSecret";
      else
        outs() << "Secret";

      outs() << "\n";
    }

    outs() << "\n";
  }

  Value *getBase(Value *V) {
    while (true) {
      if (auto *G = dyn_cast<GetElementPtrInst>(V))
        V = G->getPointerOperand();
      else if (auto *B = dyn_cast<BitCastInst>(V))
        V = B->getOperand(0);
      else
        break;
    }
    return V;
  }

  Env analyzeFunc(Function *F, Env env) {
    for (auto *f : callStack)
      if (f == F)
        return env;

    callStack.push_back(F);

    Level funcLvl = Level::Public;

    for (auto &arg : F->args()) {
      funcLvl = join(funcLvl, env.reg[&arg]);
    }

    set<Value *> local;

    for (auto &BB : *F) {
      for (auto &I : BB) {
        if (auto *A = dyn_cast<AllocaInst>(&I)) {
          local.insert(A);
          Level L = Level::Public;
          string name = A->getName().str();

          if (name == "sk" || name == "esk" || name == "O" || name == "L" ||
              name == "Ox" || name == "seed_sk" ||
              name.find("csk") != string::npos ||
              name.find("seed_sk") != string::npos ||
              name == "param_sk_seed_bytes") {
            L = Level::Secret;
          } else if (name == "V" || name == "Vdec" ||
                     name.find("Vdec") != string::npos) {
            L = Level::EphSecret;
          }

          env.mem[A] = L;
          env.reg[A] = L;
        }
      }
    }

    bool changed = true;
    while (changed) {
      changed = false;
      auto prevReg = env.reg;
      auto prevMem = env.mem;

      for (auto &BB : *F) {
        for (auto &I : BB) {

          if (dyn_cast<AllocaInst>(&I)) {
            continue;
          }

          // gep
          else if (auto *G = dyn_cast<GetElementPtrInst>(&I)) {
            Value *base = getBase(G->getPointerOperand());

            env.reg[&I] = env.reg[base];

            env.mem[&I] = env.mem[base];
          }

          // load
          else if (auto *L = dyn_cast<LoadInst>(&I)) {
            Value *ptr = L->getPointerOperand();
            Value *base = getBase(ptr);

            Level memL = env.mem[base];

            if (!isa<AllocaInst>(base) && !isa<Argument>(base)) {
              memL = join(memL, env.reg[base]);
            }
            env.reg[&I] = memL;
          }

          // store
          else if (auto *S = dyn_cast<StoreInst>(&I)) {
            Value *src = S->getValueOperand();
            Value *dst = getBase(S->getPointerOperand());

            env.mem[dst] = join(env.mem[dst], env.reg[src]);
            Value *cur = dst;
            while (auto *LI = dyn_cast<LoadInst>(cur)) {
              Value *loadSrc = getBase(LI->getPointerOperand());
              env.mem[loadSrc] = join(env.mem[loadSrc], env.reg[src]);
              cur = loadSrc;
            }
          }
          // binop
          else if (auto *B = dyn_cast<BinaryOperator>(&I)) {
            env.reg[&I] =
                join(env.reg[B->getOperand(0)], env.reg[B->getOperand(1)]);
          }

          else if (auto *C = dyn_cast<CallInst>(&I)) {
            handleCall(*C, env);
          }

          else if (auto *R = dyn_cast<ReturnInst>(&I)) {
            if (R->getReturnValue()) {
              env.returnlevel = env.reg[R->getReturnValue()];
            }
          } else if (auto *P = dyn_cast<PHINode>(&I)) {
            Level regLvl = Level::Public;
            Level memLvl = Level::Public;

            for (unsigned i = 0; i < P->getNumIncomingValues(); i++) {
              Value *inc = P->getIncomingValue(i);
              Value *base = getBase(inc);
              regLvl = join(regLvl, env.reg[inc]);
              memLvl = join(memLvl, env.mem[base]);
            }

            env.reg[P] = regLvl;
            env.mem[P] = memLvl;
          }
          // funcLvl = join(funcLvl, env.reg[&I]);
        }
      }

      for (auto &[v, lvl] : env.reg) {
        if (prevReg.find(v) == prevReg.end() || prevReg[v] != lvl) {
          changed = true;
          break;
        }
      }
      if (!changed) {
        for (auto &[v, lvl] : env.mem) {
          if (prevMem.find(v) == prevMem.end() || prevMem[v] != lvl) {
            changed = true;
            break;
          }
        }
      }
    }
    Level outLvl = env.returnlevel;

    for (Value *v : local) {
      outLvl = join(outLvl, env.mem[v]);
    }

    funcLvl = join(funcLvl, outLvl);
    funcLevel[F] = join(funcLevel[F], funcLvl);

    callStack.pop_back();

    // outs() << "\n--- Function: " << F->getName() << " ---\n";
    // if (callStack.size() >= 2) {
    //   outs() << "Called from: " << callStack[callStack.size() - 1]->getName()
    //          << "\n";
    // } else {
    //   outs() << "Called from: <entry>\n";
    // }
    // for (auto &r : env.reg) {
    //   outs() << "REG: ";
    //   r.first->print(outs());
    //   outs() << " -> Level : " << (int)r.second << "\n";
    // }

    // for (auto &m : env.mem) {
    //   outs() << "MEM: ";
    //   m.first->print(outs());
    //   outs() << " -> Level : " << (int)m.second << "\n";
    // }
    // outs() << "\n\n";
    return env;
  }

  void handleCall(CallInst &C, Env &callerEnv) {
    Function *callee = C.getCalledFunction();
    if (!callee)
      return;
    Env calleeEnv;

    if (callee->isDeclaration()) {
      StringRef name = callee->getName();

      if ((name == "memcpy" || name == "memmove" ||
           name.find("llvm.memcpy") != string::npos ||
           name.find("llvm.memmove") != string::npos) &&
          C.arg_size() >= 2) {
        Value *dst = getBase(C.getArgOperand(0));
        Value *src = getBase(C.getArgOperand(1));

        Level srcLvl = callerEnv.mem[src];
        if (!isa<AllocaInst>(src) && !isa<Argument>(src))
          srcLvl = join(srcLvl, callerEnv.reg[src]);

        callerEnv.mem[dst] = join(callerEnv.mem[dst], srcLvl);
        callerEnv.reg[&C] = Level::Public;
        return;
      }

      if ((name == "memset" || name.find("llvm.memset") != string::npos) &&
          C.arg_size() >= 2) {
        Value *dst = getBase(C.getArgOperand(0));
        Value *fillVal = C.getArgOperand(1);

        Level fillLvl = callerEnv.reg[fillVal];
        callerEnv.mem[dst] = join(callerEnv.mem[dst], fillLvl);
        callerEnv.reg[&C] = Level::Public;
        return;
      }

      if (name == "calloc" || name == "free") {
        callerEnv.reg[&C] = Level::Public;
        return;
      }

      Level ret = Level::Public;
      for (unsigned i = 0; i < C.arg_size(); i++)
        ret = join(ret, callerEnv.reg[C.getArgOperand(i)]);

      callerEnv.reg[&C] = ret;

      for (unsigned i = 0; i < C.arg_size(); i++) {
        Value *arg = C.getArgOperand(i);
        if (arg->getType()->isPointerTy()) {
          Value *base = getBase(arg);
          callerEnv.mem[base] = join(callerEnv.mem[base], ret);
        }
      }
      return;
    }

    for (int i = 0; i < C.arg_size(); i++) {
      Value *caller_arg = C.getArgOperand(i);
      Argument &callee_arg = *callee->getArg(i);

      if (caller_arg->getType()->isPointerTy()) {
        Value *base = getBase(caller_arg);
        Level memLvl = callerEnv.mem[base];

        if (!isa<AllocaInst>(base) && !isa<Argument>(base)) {
          memLvl = join(memLvl, callerEnv.reg[base]);
        }
        calleeEnv.mem[&callee_arg] = memLvl;
        calleeEnv.reg[&callee_arg] = join(callerEnv.reg[caller_arg], memLvl);
      } else {
        calleeEnv.reg[&callee_arg] = callerEnv.reg[caller_arg];
      }
      // calleeEnv.reg[&callee_arg] = callerEnv.reg[caller_arg];
      // calleeEnv.mem[&callee_arg] = callerEnv.mem[getBase(caller_arg)];
    }

    calleeEnv = analyzeFunc(callee, calleeEnv);
    map<Argument *, set<Value *>> argToAllocas;
    for (auto &BB : *callee) {
      for (auto &I : BB) {
        if (auto *S = dyn_cast<StoreInst>(&I)) {
          Value *val = S->getValueOperand();
          Value *dst = S->getPointerOperand();
          for (auto &calleeArg : callee->args()) {
            if (val == &calleeArg) {
              argToAllocas[&calleeArg].insert(dst);
            }
          }
        }
      }
    }
    for (int i = 0; i < (int)C.arg_size(); i++) {
      Value *callerArg = C.getArgOperand(i);
      Argument &calleeArg = *callee->getArg(i);

      if (callerArg->getType()->isPointerTy()) {

        Value *callerBase = getBase(callerArg);
        // Value *calleeBase = getBase(&calleeArg);
        Level memLvl =
            join(callerEnv.mem[callerBase], calleeEnv.mem[&calleeArg]);

        for (Value *alloca : argToAllocas[&calleeArg]) {
          memLvl = join(memLvl, calleeEnv.mem[alloca]);

          for (auto *U : alloca->users()) {
            if (auto *LI = dyn_cast<LoadInst>(U)) {
              memLvl = join(memLvl, calleeEnv.mem[LI]);
              // Also chase GEPs off the loaded pointer (%arrayidx1 etc.)
              for (auto *LU : LI->users()) {
                if (auto *G = dyn_cast<GetElementPtrInst>(LU)) {
                  memLvl = join(memLvl, calleeEnv.mem[G]);
                }
              }
            }
          }
        }

        if (isa<AllocaInst>(callerBase) || isa<Argument>(callerBase)) {
          callerEnv.mem[callerBase] = memLvl;
        } else {
          callerEnv.reg[callerBase] = join(callerEnv.reg[callerBase], memLvl);
          callerEnv.reg[callerArg] = join(callerEnv.reg[callerArg], memLvl);
        }

        Value *cur = callerBase;
        while (auto *LI = dyn_cast<LoadInst>(cur)) {
          Value *loadSrc = getBase(LI->getPointerOperand());
          callerEnv.mem[loadSrc] = join(callerEnv.mem[loadSrc], memLvl);
          cur = loadSrc;
        }
      }
    }

    callerEnv.reg[&C] = calleeEnv.returnlevel;
  }
};

class DefUseGraph : public PassInfoMixin<DefUseGraph> {
public:
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    Function *main = M.getFunction("main");

    for (auto &F : M) {
      outs() << "Function : " << F.getName() << "\n";
      for (auto &I : instructions(F)) {
        if (!I.getType()->isVoidTy()) {
          outs() << "\nDef : " << I << "\n";

          for (auto *U : I.users()) {
            if (auto *Ui = dyn_cast<Instruction>(U)) {
              outs() << "   Use : " << *Ui << "\n";
            }
          }
        }
      }
      outs() << "\n\n";
    }
    return PreservedAnalyses::all();
  }
};

int main() {
  LLVMContext ctx;
  SMDiagnostic err;
  auto module = parseIRFile("../no-inline/mayo1.ll", err, ctx);

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

  // Module Pass Manager
  ModulePassManager MPM;
  MPM.addPass(LevelPropPass());
  // MPM.addPass(DefUseGraph());

  // Run
  MPM.run(*module, MAM);
  return 0;
}