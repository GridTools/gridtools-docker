ARG REPOSITORY
FROM ${REPOSITORY}:base
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

RUN echo 'deb [trusted=yes] https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64 /' | tee /etc/apt/sources.list.d/nvhpc.list && \
    apt-get update -y && \
    apt-get install -y nvhpc-22-3

ENV NVHPC_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/2022
ENV PATH=${NVHPC_PATH}/compilers/bin:${PATH} CXX=${NVHPC_PATH}/compilers/bin/nvc++ CC=${NVHPC_PATH}/compilers/bin/nvc FC=${NVHPC_PATH}/compilers/bin/nvfortran