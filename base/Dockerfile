FROM ubuntu:18.04
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

SHELL ["/bin/bash", "-lc"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        wget \
        git \
        tar \
        python3 \
        software-properties-common \
        cowsay && \
    ln -s /usr/games/cowsay /usr/bin/cowsay && \
    rm -rf /var/lib/apt/lists/*

ARG CMAKE_VERSION=3.14.4
RUN cd /tmp && \
    wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
    tar xzf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
    cp -r cmake-${CMAKE_VERSION}-Linux-x86_64/bin cmake-${CMAKE_VERSION}-Linux-x86_64/share /usr/local/ && \
    rm -rf *

ARG BOOST_VERSION=1.70.0
RUN cd /tmp && \
    export BOOST_VERSION_UNERLINE=$(echo ${BOOST_VERSION} | sed 's/\./_/g') && \
    wget https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_UNERLINE}.tar.gz && \
    tar xzf boost_${BOOST_VERSION_UNERLINE}.tar.gz && \
    cp -r boost_${BOOST_VERSION_UNERLINE}/boost /usr/local/include/ && \
    rm -rf *

CMD ["/bin/bash", "-l"]