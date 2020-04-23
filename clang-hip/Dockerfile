ARG REPOSITORY
ARG CLANG_VERSION=10
FROM ${REPOSITORY}:clang-${CLANG_VERSION}
LABEL maintainer="Felix Thaler <thaler@cscs.ch>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        clang-tools-${CLANG_VERSION} \
        curl \
        gnupg \
        libnuma-dev \
        lld-${CLANG_VERSION} \
        zlib1g-dev && \
    curl -sL http://repo.radeon.com/rocm/apt/debian/rocm.gpg.key | apt-key add - && \
    printf "deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main" >> /etc/apt/sources.list.d/rocm.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends rocm-dev && \
    rm -rf /var/lib/apt/lists/*

# Note non-standard branch, might change in the future!
RUN git clone -b amd-stg-open https://github.com/RadeonOpenCompute/ROCm-Device-Libs.git && \
    cd ROCm-Device-Libs && \
    mkdir -p build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=1 .. && \
    make -j $(nproc) && \
    make install && \
    cd ../.. && rm -rf ROCm-Device-Libs

# Current HIP-Clang branch seems to be master-next, might change in the future!
RUN git clone -b master-next https://github.com/ROCm-Developer-Tools/HIP.git && \
    cd HIP && \
    mkdir -p build && cd build && \
    cmake -DHIP_COMPILER=clang -DCMAKE_BUILD_TYPE=Release .. && \
    make -j $(nproc) && \
    make install && \
    cd ../.. && rm -rf HIP

# Patch for hipcc script, fixing Clang include path
RUN sed -i 's#$HIP_CLANG_INCLUDE_PATH = abs_path("$HIP_CLANG_PATH/../lib/clang/$HIP_CLANG_VERSION/include");#$HIP_CLANG_INCLUDE_PATH = "'/usr/include/clang/${CLANG_VERSION}/include'";#' /opt/rocm/bin/hipcc

# Adding all llvm binaries to path as several of them are required by hipcc
ENV PATH=/usr/lib/llvm-${CLANG_VERSION}/bin:${PATH} LD_LIBRARY_PATH=/usr/lib/llvm-${CLANG_VERSION}/lib:${LD_LIBRARY_PATH}
# Setting HIP_CLANG_PATH seems to be required, too
ENV HIP_CLANG_PATH=/usr/lib/llvm-${CLANG_VERSION}/bin
# Default set of GPU targets, otherwise hipcc just crashes when run without corresponding flags (and kills cmake config step)
ENV HCC_AMDGPU_TARGET=gfx900,gfx906
# Finally add all rocm binaries and libraries to paths and set CXX compiler
ENV PATH=${PATH}:/opt/rocm/bin LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/rocm/lib CXX=/opt/rocm/bin/hipcc