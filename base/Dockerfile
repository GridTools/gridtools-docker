FROM ubuntu:24.04
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
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

ARG BOOST_VERSION=1.79.0
RUN cd /tmp && \
    BOOST_VERSION_UNDERLINE=$(echo ${BOOST_VERSION} | sed 's/\./_/g') && \
    wget https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_UNDERLINE}.tar.gz && \
    tar xzf boost_${BOOST_VERSION_UNDERLINE}.tar.gz && \
    cd boost_${BOOST_VERSION_UNDERLINE} && \
    ./bootstrap.sh && \
    ./b2 install && \
    rm -rf /tmp/boost_*

ARG CMAKE_VERSION=3.22.1
# note: source name scheme changed with version 3.20 (linux instead of Linux)
RUN cd /tmp && \
    VNUM=$(echo ${CMAKE_VERSION} | awk -F \. {'print $1*1000+$2'}) && \
    LNAME=$([ ${VNUM} -gt 3019 ] && echo "linux" || echo "Linux") && \
    SRC="cmake-${CMAKE_VERSION}-${LNAME}-x86_64" && \
    wget -q https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${SRC}.tar.gz && \
    tar xzf ${SRC}.tar.gz && \
    cp -r ${SRC}/bin ${SRC}/share /usr/local/ && \
    rm -rf *

CMD ["/bin/bash", "-l"]
