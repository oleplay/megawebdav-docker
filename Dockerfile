ARG RELEASE=18.04
ARG ARCH=amd64

FROM ubuntu:${RELEASE}

ARG PUID=1028
ARG PGID=101

RUN apt-get update \
    && apt-get -y install \
    --no-install-recommends \
    curl \
    gnupg2 \ 
    ca-certificates \
    && update-ca-certificates \
    && curl  \
    https://mega.nz/linux/MEGAsync/xUbuntu_${RELEASE}/${ARCH}/megacmd-xUbuntu_${RELEASE}_${ARCH}.deb --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*

RUN useradd -u ${PUID} -g ${PGID} megacmd

USER megacmd

#ENTRYPOINT ["/usr/bin/mega-cmd"]
ENTRYPOINT ["mega-cmd-server"]
