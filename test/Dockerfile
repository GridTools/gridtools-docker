ARG REPOSITORY
ARG BASE=base
FROM ${REPOSITORY}:${BASE}

COPY test-gridtools.sh /test-gridtools.sh

CMD ["/bin/bash", "-l", "/test-gridtools.sh"]