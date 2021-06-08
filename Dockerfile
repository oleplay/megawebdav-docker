ARG RELEASE=18.04

FROM ubuntu:${RELEASE}

#https://stackoverflow.com/questions/44438637/arg-substitution-in-run-command-not-working-for-dockerfile
ARG RELEASE=18.04
ARG ARCH=amd64
ARG USER=megacmd
ARG GROUP=megausers

ARG PUID=1028
ARG PGID=101

RUN groupadd -g ${PGID} ${GROUP} && useradd -u ${PUID} ${USER} && usermod -g ${GROUP} ${USER}

RUN echo ${RELEASE} && echo ${ARCH} && echo ${USER} && echo ${GROUP} && echo ${PUID} && echo ${PGID} && echo https://mega.nz/linux/MEGAsync/xUbuntu_${RELEASE}/${ARCH}/megacmd-xUbuntu_${RELEASE}_${ARCH}.deb

#RUN groupadd -g 101 megausers && useradd -u 1028 megacmd && usermod -g megausers megacmd

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

USER ${USER}

#ENTRYPOINT ["/usr/bin/mega-cmd"]
ENTRYPOINT ["mega-cmd-server"]
CMD ["mega-version --skip-lock-check"]
