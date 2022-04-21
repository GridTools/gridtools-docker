ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

# from https://docs.amd.com/bundle/ROCm-Installation-Guide-v5.1.1/page/How_to_Install_ROCm.html
RUN wget https://repo.radeon.com/amdgpu-install/22.10.1/ubuntu/focal/amdgpu-install_22.10.1.50101-1_all.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y ./amdgpu-install_22.10.1.50101-1_all.deb && \
    apt-get update -qq && \
    amdgpu-install -y --usecase=rocm,hip --no-dkms && \
    rm -rf /var/lib/apt/lists/*

ENV ROCM_PATH=/opt/rocm
ENV PATH=${ROCM_PATH}/bin:${PATH} CXX=${ROCM_PATH}/bin/hipcc
