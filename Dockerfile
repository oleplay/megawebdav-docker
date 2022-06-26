ARG RELEASE=21.04
FROM ubuntu:${RELEASE}

#https://stackoverflow.com/questions/44438637/arg-substitution-in-run-command-not-working-for-dockerfile
ARG RELEASE=21.04
ARG ARCH=amd64
ENV USER=megacmd
ENV GROUP=megausers

ENV PUID=1000
ENV PGID=1000

RUN apt-get update \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin \
    && apt-get -y --no-install-recommends install \
    curl \
    autoconf \
    libtool \
    g++ \
    libcrypto++-dev \
    libz-dev \
    libsqlite3-dev \
    libssl-dev \
    libcurl4-gnutls-dev \
    libreadline-dev \
    libpcre++-dev \
    libsodium-dev \
    libc-ares-dev \
    libfreeimage-dev \
    libavcodec-dev \
    libavutil-dev \
    libavformat-dev \
    libswscale-dev \
    libmediainfo-dev \
    libzen-dev \
    libuv1-dev \
    software-properties-common \
    && add-apt-repository https://mega.nz/linux/repo/xUbuntu_${RELEASE}/ \
    && apt update \ 
    && apt install megacmd \
    && apt-get clean 

RUN groupadd -g ${PGID} ${GROUP} && useradd -u ${PUID} ${USER} && usermod -g ${GROUP} ${USER} && usermod -G root ${USER} && usermod -g sudo ${USER}
RUN echo ${USER} 'ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/${USER}/
COPY ./fix_permissions.sh ./fix_permissions.sh
COPY ./megacmd_start.sh ./megacmd_start.sh
RUN chmod +x fix_permissions.sh
RUN chmod +x megacmd_start.sh

CMD ./megacmd_start.sh
