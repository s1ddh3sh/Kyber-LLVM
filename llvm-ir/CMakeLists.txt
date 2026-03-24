cmake_minimum_required(VERSION 3.20)

project(llvm-demo)

SET(LLVM_DIR "/usr/lib/llvm-20/lib/cmake/llvm")
SET(CLANG_DIR "/usr/lib/llvm-20/lib/cmake/clang")

set(CMAKE_PREFIX_PATH "/usr/lib/llvm-20")

find_package(LLVM REQUIRED CONFIG HINTS ${LLVM_DIR} NO_DEFAULT_PATH)
find_package(Clang REQUIRED CONFIG HINTS ${CLANG_DIR} NO_DEFAULT_PATH)

# find_package(Clang REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")

# LLVM setup
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(SYSTEM ${CLANG_INCLUDE_DIRS})

add_definitions(${LLVM_DEFINITIONS})

# Clang includes
include_directories(${CLANG_INCLUDE_DIRS})


add_executable(kyber-ir llvm-gen.cpp)

# Link Clang *components*
target_link_libraries(kyber-ir
  PRIVATE
  clangFrontend
  clangDriver
  clangSerialization
  clangCodeGen
  clangParse
  clangSema
  clangAnalysis
  clangAST
  clangASTMatchers
  clangEdit
  clangLex
  clangBasic
)

