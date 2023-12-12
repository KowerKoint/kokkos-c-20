FROM nvidia/cuda:12.2.0-devel-ubuntu20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    apt-get install -y cmake g++-10 git ninja-build && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
