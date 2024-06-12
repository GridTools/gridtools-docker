ARG REPOSITORY
FROM ${REPOSITORY}:base
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG NVHPC_VERSION
ENV NVHPC_VERSION ${NVHPC_VERSION}

RUN NVHPC_VERSION_DASH=$(echo ${NVHPC_VERSION} | sed 's/\./-/g') && \
    wget https://developer.download.nvidia.com/hpc-sdk/ubuntu/DEB-GPG-KEY-NVIDIA-HPC-SDK && \
    gpg --dearmor -o /usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg << DEB-GPG-KEY-NVIDIA-HPC-SDK && \
    echo 'deb [signed-by=/usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg] https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64 /' | tee /etc/apt/sources.list.d/nvhpc.list && \
    apt-get update -qq -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y nvhpc-${NVHPC_VERSION_DASH} && \
    rm -rf /var/lib/apt/lists/*

ENV NVHPC_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/${NVHPC_VERSION}
ENV PATH=${NVHPC_PATH}/compilers/bin:${PATH} CXX=${NVHPC_PATH}/compilers/bin/nvc++ CC=${NVHPC_PATH}/compilers/bin/nvc FC=${NVHPC_PATH}/compilers/bin/nvfortran
