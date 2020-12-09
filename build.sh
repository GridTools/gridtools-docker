#!/bin/sh

set -e

# Base
docker build -t $1:base base

# GCC
for version in 8 9 10; do
    docker build --build-arg REPOSITORY=$1 --build-arg GCC_VERSION=$version -t $1:gcc-$version gcc
done

# Clang
for version in 9 10 11; do
    docker build --build-arg REPOSITORY=$1 --build-arg CLANG_VERSION=$version -t $1:clang-$version clang
done

# CUDA
docker build --build-arg REPOSITORY=$1 -t $1:cuda-11.0 cuda

# Clang-CUDA
for clang_version in 9 10 11; do
    docker build --build-arg REPOSITORY=$1 --build-arg CLANG_VERSION=$clang_version -t $1:clang-$clang_version-cuda-10.1 clang-cuda
done

# HIP
docker build --build-arg REPOSITORY=$1 -t $1:hip hip

# GCC with HPX (not by default as it will increase docker build time significantly)
#for gcc_version in 10; do
#    docker build --build-arg REPOSITORY=$1 --build-arg GCC_VERSION=$gcc_version --build-arg HPX_TAG=master -t $1:gcc-$version-hpx gcc-hpx
#done

# with atlas
for compiler in "gcc"; do
    for version in 9; do
        docker build --build-arg REPOSITORY=$1 --build-arg COMPILER=$compiler --build-arg VERSION=$version -t $1:$compiler-$version-atlas atlas
    done
done
