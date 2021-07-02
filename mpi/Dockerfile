ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Marco Bettiol <marco.bettiol@cscs.ch>"

ARG MPI_VERSION=4.1
ARG MPI_VERSION_FULL=${MPI_VERSION}.1
RUN cd /tmp && \
    wget -q https://download.open-mpi.org/release/open-mpi/v${MPI_VERSION}/openmpi-${MPI_VERSION_FULL}.tar.gz && \
    tar xzf openmpi-${MPI_VERSION_FULL}.tar.gz && \
    cd openmpi-${MPI_VERSION_FULL} && \
    ./configure --with-hwloc=internal --with-ucx=/opt/ucx --prefix=/opt/openmpi_ucx && \
    make all install && \
    rm -rf /tmp/openmpi-${MPI_VERSION_FULL}.tar.gz /tmp/openmpi-${MPI_VERSION_FULL}

ENV MPIROOT=/opt/openmpi_ucx
ENV PATH=${MPIROOT}/bin:${PATH} LD_LIBRARY_PATH=${MPIROOT}/lib:${LD_LIBRARY_PATH} PKG_CONFIG_PATH=${MPIROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}