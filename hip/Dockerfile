ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

# from https://docs.amd.com/bundle/ROCm-Installation-Guide-v5.4/page/How_to_Install_ROCm.html
# TODO(havogt): remove jammy packages once official support for 24.04 is there,
# workaround taken from https://github.com/nktice/AMD-AI/blob/99b51b7ce08f339e81ccede05d65a21d10c6a27b/README.md
RUN add-apt-repository -y -s deb http://security.ubuntu.com/ubuntu jammy main universe && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    wget https://repo.radeon.com/amdgpu-install/22.40/ubuntu/jammy/amdgpu-install_5.4.50401-1_all.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y ./amdgpu-install_5.4.50401-1_all.deb && \
    apt-get update -qq && \
    amdgpu-install -y --usecase=rocm,hip --no-dkms && \
    rm -rf /var/lib/apt/lists/*

ENV ROCM_PATH=/opt/rocm
ENV PATH=${ROCM_PATH}/bin:${PATH} CXX=${ROCM_PATH}/bin/hipcc
