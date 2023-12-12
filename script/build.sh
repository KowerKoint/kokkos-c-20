#!/bin/sh

set -eux

mkdir -p build
cmake -B build -G Ninja -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release
ninja -C build
