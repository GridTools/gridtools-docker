ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG ECBUILD_VERSION=3.6.3
RUN cd /tmp && \
    wget -q https://github.com/ecmwf/ecbuild/archive/${ECBUILD_VERSION}.tar.gz && \
    tar xzf ${ECBUILD_VERSION}.tar.gz && \
    mv ecbuild-${ECBUILD_VERSION} /ecbuild && \
    rm -rf /tmp/*

ENV PATH=/ecbuild/bin:${PATH}

ARG ECKIT_VERSION=1.17.1
RUN cd /tmp && \
    wget -q https://github.com/ecmwf/eckit/archive/${ECKIT_VERSION}.tar.gz && \
    tar xzf ${ECKIT_VERSION}.tar.gz && \
    cd eckit-${ECKIT_VERSION} && \
    mkdir build && cd build && \
    ecbuild .. && \
    make -j$(nproc) install && \
    rm -rf /tmp/*


# patch atlas: add missing include <string>
ARG ATLAS_VERSION=0.26.0
RUN cd /tmp && \
    wget -q https://github.com/ecmwf/atlas/archive/${ATLAS_VERSION}.tar.gz && \
    tar xzf ${ATLAS_VERSION}.tar.gz && \
    cd atlas-${ATLAS_VERSION} && \
    mkdir build && cd build && \
    ecbuild .. && \
    make -j$(nproc) install && \
    rm -rf /tmp/*
