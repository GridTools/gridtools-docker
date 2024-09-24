ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

# NOTE: If you change the ROCm version here, also change it in the build.yml to avoid overwriting the old image,
# see https://github.com/GridTools/gridtools-docker/issues/97.
RUN wget https://repo.radeon.com/amdgpu-install/6.2.1/ubuntu/noble/amdgpu-install_6.2.60201-1_all.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y ./amdgpu-install_6.2.60201-1_all.deb && \
    apt-get update -qq && \
    amdgpu-install -y --usecase=rocm,hip --no-dkms && \
    rm -rf /var/lib/apt/lists/*

ENV ROCM_PATH=/opt/rocm
ENV PATH=${ROCM_PATH}/bin:${PATH} CXX=${ROCM_PATH}/bin/hipcc
