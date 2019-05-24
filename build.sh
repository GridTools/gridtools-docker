#!/bin/sh

set -e

# Base
docker build -t $1:base base

# GCC
docker build --build-arg REPOSITORY=$1 --build-arg GCC_VERSION=9 -t $1:gcc-9 gcc
docker build --build-arg REPOSITORY=$1 --build-arg BASE=gcc-9 -t $1:test-gcc-9 test

# Clang
docker build --build-arg REPOSITORY=$1 --build-arg CLANG_VERSION=8 -t $1:clang-8 clang
docker build --build-arg REPOSITORY=$1 --build-arg BASE=clang-8 -t $1:test-clang-8 test

# CUDA
docker build --build-arg REPOSITORY=$1 -t $1:cuda-10.1 cuda
docker build --build-arg REPOSITORY=$1 --build-arg BASE=cuda-10.1 -t $1:test-cuda-10.1 test