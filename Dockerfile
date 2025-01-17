ARG RELEASE=21.04
FROM ubuntu:${RELEASE}

#https://stackoverflow.com/questions/44438637/arg-substitution-in-run-command-not-working-for-dockerfile
ARG RELEASE=21.04
ARG ARCH=amd64
ENV USER=megacmd
ENV GROUP=megausers

ENV PUID=1000
ENV PGID=1000

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

RUN apt-get update \
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
    ca-certificates \
    gnupg2 \ 
    wget \
    && apt-get clean 

RUN wget -O- https://github.com/meganz/MEGAsync/raw/706757d55566bf83007abd17defc4fefa97ace4b/build/MEGAsync/MEGAsync/debian.postinst | sed '106,157!d' | gpg --dearmor | tee /usr/share/keyrings/meganz-archive-keyring.gpg
RUN sh -c "echo deb [arch=amd64 signed-by=/usr/share/keyrings/meganz-archive-keyring.gpg] https://mega.nz/linux/repo/xUbuntu_${RELEASE}/ ./" >> /etc/apt/sources.list
RUN apt-get update \
    && apt-get -y --no-install-recommends install megacmd \ 
    && apt-get clean

RUN addgroup --gid 1337 app && adduser --uid 1337 --gid 1337 --disabled-password --gecos "App User" app

WORKDIR /home/${USER}/
COPY ./megacmd_start.sh ./megacmd_start.sh
RUN chmod +x megacmd_start.sh

USER 1337:1337

CMD ./megacmd_start.sh
