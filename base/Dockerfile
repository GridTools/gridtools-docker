FROM ubuntu:20.04
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

SHELL ["/bin/bash", "-lc"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install -qq -y \
        build-essential \
        libboost-all-dev \
        ccache \
        cmake \
        wget \
        git \
        tar \
        python3 \
        python3-pip \
        software-properties-common \
        cowsay && \
    ln -s /usr/games/cowsay /usr/bin/cowsay && \
    rm -rf /var/lib/apt/lists/*

# ARG CMAKE_VERSION=3.14.5
# RUN cd /tmp && \
#     wget -q https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
#     tar xzf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
#     cp -r cmake-${CMAKE_VERSION}-Linux-x86_64/bin cmake-${CMAKE_VERSION}-Linux-x86_64/share /usr/local/ && \
#     rm -rf *

CMD ["/bin/bash", "-l"]
