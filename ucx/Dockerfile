ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Marco Bettiol <marco.bettiol@cscs.ch>"

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
        autoconf \
        libtool \
        libnuma-dev && \
    rm -rf /var/lib/apt/lists/*

ARG UCX_VERSION=1.10.1
RUN cd /tmp && \
    git clone https://github.com/openucx/ucx.git && \
    cd ucx && \
    git checkout v${UCX_VERSION} && \
    ./autogen.sh && \
    ./configure --disable-logging --disable-debug --disable-assertions --disable-params-check --enable-optimizations --enable-compiler-opt=3 --enable-mt --enable-devel-headers --without-java --prefix=/opt/ucx && \
    make -j$(nproc) && make install && \
    rm -rf /tmp/ucx

ENV UCX_TLS=self,tcp