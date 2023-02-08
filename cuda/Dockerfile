ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG CUDA_VERSION
ENV CUDA_VERSION ${CUDA_VERSION}

# from https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.8.0/ubuntu2004/base/Dockerfile
RUN apt-get update -qq && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2204/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \
    rm -rf /var/lib/apt/lists/*

RUN CUDA_VERSION_DASH=$(echo ${CUDA_VERSION} | sed 's/\./-/g') && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y cuda-minimal-build-${CUDA_VERSION_DASH} libcurand-dev-${CUDA_VERSION_DASH} && \
    rm -rf /var/lib/apt/lists/*

ENV CUDACXX=/usr/local/cuda-${CUDA_VERSION}/bin/nvcc CUDAHOSTCXX=${CXX}
