ARG REPOSITORY
FROM ${REPOSITORY}:base
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG CLANG_VERSION
ENV CLANG_VERSION ${CLANG_VERSION}

RUN echo "deb http://apt.llvm.org/noble/ llvm-toolchain-noble-${CLANG_VERSION} main" >> /etc/apt/sources.list && \
    echo "deb-src http://apt.llvm.org/noble/ llvm-toolchain-noble-${CLANG_VERSION} main" >> /etc/apt/sources.list && \
    wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y clang-${CLANG_VERSION} libomp-${CLANG_VERSION}-dev && \
    rm -rf /var/lib/apt/lists/*

ENV CXX=clang++-${CLANG_VERSION} CC=clang-${CLANG_VERSION} CUDAHOSTCXX=clang++-${CLANG_VERSION}
