ARG REPOSITORY
ARG CLANG_VERSION=9
FROM ${REPOSITORY}:clang-${CLANG_VERSION}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ENV CLANG_VERSION ${CLANG_VERSION}

RUN cd /tmp && \
    wget -q https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb && \
    dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb && \
    apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub && \
    apt-get update -qq && \
    apt-get install -qq -y cuda-compiler-11-0 cuda-libraries-dev-11-0 && \
    rm -rf * && \
    dpkg -r $(dpkg-query -f '${Package}' -W 'cuda-repo-*') && \
    rm -rf /var/lib/apt/lists/*

ENV CUDACXX=/usr/local/cuda-10.1/bin/nvcc
