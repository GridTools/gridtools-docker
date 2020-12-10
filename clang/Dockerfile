ARG REPOSITORY
FROM ${REPOSITORY}:base
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG CLANG_VERSION
ENV CLANG_VERSION ${CLANG_VERSION}

RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-${CLANG_VERSION} main" >> /etc/apt/sources.list && \
    echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-${CLANG_VERSION} main" >> /etc/apt/sources.list && \
    wget -q -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y clang-${CLANG_VERSION} && \
    rm -rf /var/lib/apt/lists/*

ENV CXX=clang++-${CLANG_VERSION} CC=clang-${CLANG_VERSION} CUDAHOSTCXX=clang++-${CLANG_VERSION}
