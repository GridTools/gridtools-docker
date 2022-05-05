ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

# from https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.6.2/ubuntu2004/base/Dockerfile
RUN apt-get update -qq && \
    wget -q -O- https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y cuda-minimal-build-11-6 libcurand-dev-11-6 && \
    rm -rf /var/lib/apt/lists/*

ENV CUDACXX=/usr/local/cuda-11.6/bin/nvcc CUDAHOSTCXX=${CXX}
