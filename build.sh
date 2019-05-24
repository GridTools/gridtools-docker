#!/bin/sh

set -e

# Base
docker build -t $1:base base

# GCC
for version in 7 8 9; do
    docker build --build-arg REPOSITORY=$1 --build-arg GCC_VERSION=$version -t $1:gcc-$version gcc
    docker build --build-arg REPOSITORY=$1 --build-arg BASE=gcc-$version -t $1:test-gcc-$version test
done

# Clang
for version in 7 8; do
    docker build --build-arg REPOSITORY=$1 --build-arg CLANG_VERSION=$version -t $1:clang-$version clang
    docker build --build-arg REPOSITORY=$1 --build-arg BASE=clang-$version -t $1:test-clang-$version test
done

# CUDA
docker build --build-arg REPOSITORY=$1 -t $1:cuda-10.1 cuda
docker build --build-arg REPOSITORY=$1 --build-arg BASE=cuda-10.1 -t $1:test-cuda-10.1 test