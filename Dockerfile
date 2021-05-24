FROM ubuntu:hirsute

ARG RELEASE=21.04
ARG ARCH=amd64

ENV PUID=1000
ENV PGID=1000

RUN apt-get update && apt-get -y install gpgv2

RUN apt-get update \
    && apt-get -y install \
    --no-install-recommends \
    curl \
    ca-certificates \
    && update-ca-certificates \
    && curl  \
    https://mega.nz/linux/MEGAsync/xUbuntu_${RELEASE}/${ARCH}/megacmd-xUbuntu_${RELEASE}_${ARCH}.deb \
    --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*

USER ${PUID}:${PGID}

#ENTRYPOINT ["/usr/bin/mega-cmd"]
ENTRYPOINT ["mega-cmd-server"]
