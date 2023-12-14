#!/bin/sh
set -eux

mkdir -p build
cmake -B build -G Ninja -DCMAKE_CXX_COMPILER=g++-10 -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/opt/kokkos/lib/cmake/Kokkos
ninja -C build
