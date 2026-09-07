#!/bin/bash
# ProgramBench-style build: must produce ./executable at the repo root.
set -e
cd "$(dirname "$0")"
rm -rf build
# duckdb C++ compiles are memory-heavy; hard-cap cmake --build parallelism.
export CMAKE_BUILD_PARALLEL_LEVEL=2
export MAKEFLAGS="-j2"
make
cp build/release/duckdb executable
