ARG REPOSITORY
FROM ${REPOSITORY}:gcc-9

RUN  apt-get update -qq && \
     apt-get install -qq -y libopenmpi-dev && \
     rm -rf /var/lib/apt/lists/*
