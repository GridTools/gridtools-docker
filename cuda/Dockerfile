ARG REPOSITORY
FROM ${REPOSITORY}:base
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

RUN cd /tmp && \
    wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb && \
    dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb && \
    apt-key add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub && \
    apt-get update && \
    apt-get install -y cuda-minimal-build-10-1 && \
    rm -rf * && \
    dpkg -r $(dpkg-query -f '${Package}' -W 'cuda-repo-*') && \
    rm -rf /var/lib/apt/lists/*

ENV CUDACXX=/usr/local/cuda-10.1/bin/nvcc