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
for version in 7 8 9 10; do
    docker build --build-arg REPOSITORY=$1 --build-arg CLANG_VERSION=$version -t $1:clang-$version clang
    docker build --build-arg REPOSITORY=$1 --build-arg BASE=clang-$version -t $1:test-clang-$version test
done

# CUDA
docker build --build-arg REPOSITORY=$1 -t $1:cuda-10.1 cuda
docker build --build-arg REPOSITORY=$1 --build-arg BASE=cuda-10.1 -t $1:test-cuda-10.1 test

# Clang-CUDA
for clang_version in 9 10; do
    docker build --build-arg REPOSITORY=$1 --build-arg CLANG_VERSION=$clang_version -t $1:clang-$clang_version-cuda-10.1 clang-cuda
    docker build --build-arg REPOSITORY=$1 --build-arg BASE=clang-$clang_version-cuda-10.1 -t $1:test-clang-$clang_version-cuda-10.1 test
done

# HIP
for clang_version in 10; do
    docker build --build-arg REPOSITORY=$1 --build-arg CLANG_VERSION=$clang_version -t $1:clang-$clang_version-hip clang-hip
    docker build --build-arg REPOSITORY=$1 --build-arg BASE=clang-$clang_version-hip -t $1:test-clang-$clang_version-hip test
done

# GCC with HPX (not by default as it will increase docker build time significantly)
for gcc_version in 9; do
    docker build --build-arg REPOSITORY=$1 --build-arg GCC_VERSION=$gcc_version --build-arg HPX_TAG=master -t $1:gcc-$version-hpx gcc-hpx
    docker build --build-arg REPOSITORY=$1 --build-arg BASE=gcc-$version-hpx -t $1:test-gcc-$version-hpx test
done

# with atlas
for compiler in "gcc" "clang"; do
    for version in 10; do
        docker build --build-arg REPOSITORY=$1 --build-arg COMPILER=$compiler --build-arg VERSION=$version -t $1:$compiler-$version-atlas $compiler-atlas
    done
done
