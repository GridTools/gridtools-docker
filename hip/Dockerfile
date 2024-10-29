ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG ROCM_VERSION
ENV ROCM_VERSION ${ROCM_VERSION}

# NOTE: the newest ROCm release should allow to also install older releases. However, older releases
# might not necessarily be available on the current Ubuntu version. For example, on Ubuntu 24.04,
# ROCm 6.2 is currently the only available release.
RUN wget https://repo.radeon.com/amdgpu-install/6.2.2/ubuntu/noble/amdgpu-install_6.2.60202-1_all.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y ./amdgpu-install_6.2.60202-1_all.deb && \
    apt-get update -qq && \
    amdgpu-install -y --usecase=hiplibsdk --no-dkms --rocmrelease=${ROCM_VERSION} && \
    rm -rf /var/lib/apt/lists/* && \
    cd /opt/rocm-${ROCM_VERSION}/lib && rm -rf hipblaslt hipsparselt rocblas rocfft libdevice_*_operations.a librocsolver* librocblas* libhipblas* librocsparse* librocrand* librccl* libhiptensor*

ENV ROCM_PATH=/opt/rocm-${ROCM_VERSION}
ENV PATH=${ROCM_PATH}/bin:${PATH} CXX=${ROCM_PATH}/bin/hipcc
