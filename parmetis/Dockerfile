ARG REPOSITORY
ARG BASE
FROM ${REPOSITORY}:${BASE}
LABEL maintainer="Marco Bettiol <marco.bettiol@cscs.ch>"

ARG PARMETIS_VERSION=4.0.3-p3
RUN cd /tmp && \
    wget -q https://www.mcs.anl.gov/petsc/mirror/externalpackages/parmetis-{PARMETIS_VERSION}.tar.gz && \
    tar xzf parmetis-${PARMETIS_VERSION}.tar.gz && \
    cd parmetis-${PARMETIS_VERSION} && \
    sed -i 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/g' metis/include/metis.h && \
    cd metis && \
    make config shared=1 prefix=/opt/metis/ && \
    make install && \
    cd .. && \
    make config shared=1 prefix=/opt/parmetis/ && \
    make install && \
    rm -rf /tmp/parmetis-${PARMETIS_VERSION}.tar.gz /tmp/parmetis-${PARMETIS_VERSION}
