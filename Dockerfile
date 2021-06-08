ARG RELEASE=18.04
ARG ARCH=amd64
ARG USER=megacmd
ARG GROUP=megausers
#https://mega.nz/linux/MEGAsync/xUbuntu_${RELEASE}/${ARCH}/megacmd-xUbuntu_${RELEASE}_${ARCH}.deb

FROM ubuntu:${RELEASE}

ARG PUID=1028
ARG PGID=101

#RUN useradd -u ${PUID} -g ${PGID} megacmd

#RUN groupadd -g ${PGID} ${GROUP}
#RUN useradd -u ${PUID} ${USER}
#RUN usermod -g ${GROUP} ${USER}

RUN groupadd -g 101 megausers && useradd -u 1028 megacmd && usermod -g megausers -G wheel megacmd

#USER ${USER}
USER megacmd

RUN apt-get update \
    && apt-get -y install \
    --no-install-recommends \
    curl \
    gnupg2 \ 
    ca-certificates \
    && update-ca-certificates \
    && curl  \
    https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megacmd-xUbuntu_18.04_amd64.deb --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*  

#ENTRYPOINT ["/usr/bin/mega-cmd"]
ENTRYPOINT ["mega-cmd-server"]
#CMD ["mega-version"]
