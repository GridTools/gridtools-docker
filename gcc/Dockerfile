ARG REPOSITORY
FROM ${REPOSITORY}:base
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG GCC_VERSION=9
ENV GCC_VERSION ${GCC_VERSION}

RUN apt-get update -qq && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get install -qq -y \
        g++-${GCC_VERSION} \
        gcc-${GCC_VERSION} \
        gfortran-${GCC_VERSION} && \
    rm -rf /var/lib/apt/lists/*

ENV CXX=g++-${GCC_VERSION} CC=gcc-${GCC_VERSION}