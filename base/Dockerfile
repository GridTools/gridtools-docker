FROM ubuntu:21.04
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
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

CMD ["/bin/bash", "-l"]
