FROM alpine

RUN apk add --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing --update --no-cache \
    c-ares \
    crypto++ \
    libcurl \
    libtool \
    libuv \
    libpcrecpp \
    libsodium \
    sqlite-libs \
    sqlite \
    pcre \
    readline \
    freeimage \
    zlib \
    \
    && apk add --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing --update --no-cache --virtual .build-deps \
    autoconf \
    automake \
    c-ares-dev \
    crypto++-dev \
    curl \
    curl-dev \
    file \
    g++ \
    gcc \
    git \
    sqlite-dev \
    pcre-dev \
    libc-dev \
    libffi-dev \
    libressl-dev \
    libsodium \
    libsodium-dev \
    libuv-dev \
    make \
    openssl \
    openssl-dev \
    readline-dev \
    zlib-dev \
    freeimage-dev \
    \
    && git clone https://github.com/meganz/MEGAcmd.git /opt/MEGAcmd \
    && cd /opt/MEGAcmd \
    && git submodule update --init --recursive \
    && sh autogen.sh \
    && ./configure \
    && make -j $(nproc) \
    && make install \
    && cd / \
    && rm -rf /opt/MEGAcmd \
    \
    && apk del .build-deps \
    && find /usr/local/bin -type f  -executable -name 'mega-*' \
        -not -name 'mega-cmd-server' -not -name 'mega-exec' \
        -print0 | xargs -n 1 -0 -I{} sh -c 'if [ -f "{}" ]; then echo "Testing: {}"; {} --help > /dev/null || exit 255; fi' \
    && mega-put --help > /dev/null \
    && mega-export --help > /dev/null \
    && rm -rf /root/.megaCmd /tmp/*
