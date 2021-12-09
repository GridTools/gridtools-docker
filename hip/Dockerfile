ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

RUN wget https://repo.radeon.com/amdgpu-install/21.40/ubuntu/focal/amdgpu-install-21.40.40500-1_all.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y ./amdgpu-install-21.40.40500-1_all.deb && \
    apt-get update -qq && \
    amdgpu-install -y --usecase=hip --no-dkms && \
    rm -rf /var/lib/apt/lists/*

ENV ROCM_PATH=/opt/rocm-4.5.0
ENV PATH=${ROCM_PATH}/bin:${PATH} CXX=${ROCM_PATH}/bin/hipcc
