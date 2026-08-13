cmake_minimum_required(VERSION 3.20)

project(fault_types)
set(LLVM_DIR "/usr/lib/llvm-20/lib/cmake/llvm")

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# LLVM setup
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# Z3 setup
find_package(Z3 QUIET)
if(NOT Z3_FOUND)
  # Fall back to pkg-config if find_package fails
  find_package(PkgConfig QUIET)
  if(PkgConfig_FOUND)
    pkg_check_modules(Z3 REQUIRED z3)
  else()
    message(FATAL_ERROR "Z3 not found and pkg-config not available")
  endif()
endif()

add_executable(loop_fn_Fault loop_fn_Fault.cpp)
add_executable(binOp_load_store_Fault binOp_load_store_Fault.cpp)
add_executable(fuse_back fuse_back.cpp)
# add_executable(smt_parser ../smt_queries/smt_parser_main.cpp)

# Map needed LLVM components to library names
llvm_map_components_to_libnames(LLVM_LIBS
  core
  support
  irreader
  analysis
  passes
)

# --------------------
# Link LLVM libraries
# --------------------
target_link_libraries(loop_fn_Fault
  PRIVATE
  ${LLVM_LIBS}
)
target_link_libraries(binOp_load_store_Fault
  PRIVATE
  ${LLVM_LIBS}
)
target_link_libraries(fuse_back
  PRIVATE
  ${LLVM_LIBS}
)

# target_link_libraries(smt_parser
#   PRIVATE
#   ${Z3_LIBRARIES}
# )

# target_include_directories(smt_parser
#   PRIVATE
#   ${Z3_INCLUDE_DIRS}
# )