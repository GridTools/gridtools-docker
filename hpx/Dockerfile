ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

ARG HPX_TAG=master

RUN cd /tmp && \
    git clone --single-branch --branch ${HPX_TAG} --depth 1 https://github.com/STEllAR-GROUP/hpx.git && \
    cd hpx && \
    mkdir build && cd build && \
    cmake .. -DHPX_WITH_MALLOC=system -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=Release -DHPX_WITH_EXAMPLES=OFF -DHPX_WITH_TESTS=OFF -DHPX_WITH_COMPILE_ONLY_TESTS=OFF -DHPX_WITH_FAIL_COMPILE_TESTS=OFF && \
    make -j$(nproc) install && \
    cd ../.. && rm -rf hpx

RUN echo "Hello World!"
