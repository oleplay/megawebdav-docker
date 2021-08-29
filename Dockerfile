ARG RELEASE=18.04

FROM ubuntu:${RELEASE}

#https://stackoverflow.com/questions/44438637/arg-substitution-in-run-command-not-working-for-dockerfile
ARG RELEASE=18.04
ARG ARCH=amd64
ENV USER=megacmd
ENV GROUP=megausers

ENV PUID=1000
ENV PGID=1000
ENV SESSION_ID=session_token

RUN groupadd -g ${PGID} ${GROUP} && useradd -u ${PUID} ${USER} && usermod -g ${GROUP} ${USER} && usermod -G root ${USER} && usermod -g sudo ${USER}
RUN echo ${USER} 'ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#USER ${USER}

RUN apt-get update \
    && sudo apt-get -y install \
    --no-install-recommends \
    sudo \
    curl \
    gnupg2 \ 
    ca-certificates \
    && update-ca-certificates \
    && curl  \
    https://mega.nz/linux/MEGAsync/xUbuntu_${RELEASE}/${ARCH}/megacmd-xUbuntu_${RELEASE}_${ARCH}.deb --output /tmp/megacmd.deb \
    && apt install /tmp/megacmd.deb -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/megacmd.*

WORKDIR /home/${USER}/
COPY ./fix_permissions.sh ./fix_permissions.sh
COPY ./megacmd_start.sh ./megacmd_start.sh
RUN chmod +x fix_permissions.sh
RUN chmod +x megacmd_start.sh
#USER ${USER}

ENTRYPOINT ./fix_permissions.sh && su -c ./megacmd_start.sh ${USER}
