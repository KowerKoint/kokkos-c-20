FROM nvidia/cuda:12.2.0-devel-ubuntu20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git ninja-build software-properties-common wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# latest GCC
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gcc-13 g++-13 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# latest CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.28.0/cmake-3.28.0-Linux-x86_64.sh -q -O /tmp/cmake-install.sh && \
    chmod u+x /tmp/cmake-install.sh && \
    mkdir /opt/cmake-3.28.0 && \
    /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.28.0 && \
    rm /tmp/cmake-install.sh && \
    ln -s /opt/cmake-3.28.0/bin/* /usr/local/bin

# latest Kokkos
RUN git clone --recursive https://github.com/kokkos/kokkos.git /tmp/kokkos --depth 1 && \
    cd /tmp/kokkos && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_CXX_STANDARD=20 -DCMAKE_INSTALL_PREFIX=/opt/kokkos -DKokkos_ENABLE_CUDA=ON -DKokkos_ARCN_CUDA=ON && \
    make -j$(nproc) install && \
    rm -rf /tmp/kokkos
