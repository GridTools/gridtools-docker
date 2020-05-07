FROM ubuntu:18.04
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

SHELL ["/bin/bash", "-lc"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install -qq -y \
        build-essential \
        ccache \
        wget \
        git \
        tar \
        python3 \
        python3-pip \
        software-properties-common \
        cowsay && \
    ln -s /usr/games/cowsay /usr/bin/cowsay && \
    rm -rf /var/lib/apt/lists/*

ARG CMAKE_VERSION=3.14.5
RUN cd /tmp && \
    wget -q https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
    tar xzf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
    cp -r cmake-${CMAKE_VERSION}-Linux-x86_64/bin cmake-${CMAKE_VERSION}-Linux-x86_64/share /usr/local/ && \
    rm -rf *

ARG BOOST_VERSION=1.70.0
RUN cd /tmp && \
    export BOOST_VERSION_UNERLINE=$(echo ${BOOST_VERSION} | sed 's/\./_/g') && \
    wget -q https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_UNERLINE}.tar.gz && \
    tar xzf boost_${BOOST_VERSION_UNERLINE}.tar.gz && \
    cp -r boost_${BOOST_VERSION_UNERLINE}/boost /usr/local/include/ && \
    rm -rf *

RUN  apt-get update -qq && \
     apt-get install -qq -y mpich && \
     rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ecmwf/ecbuild

RUN git clone https://github.com/ecmwf/eckit && \
    cd eckit && \
    git checkout master && \
    mkdir -p build && cd build && \
    /ecbuild/bin/ecbuild --build=RELEASE --prefix=/opt/eckit -- ../ && \
    make install

RUN git clone https://github.com/ecmwf/atlas && \
    pwd && \
    cd atlas && \
    git checkout master && \
    mkdir -p build && cd build && \
    export ECKIT_PATH=/opt/eckit && \
    /ecbuild/bin/ecbuild --build=RELEASE --prefix=/opt/atlas -- ../ && \
    make install

CMD ["/bin/bash", "-l"]
