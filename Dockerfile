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
    && apt-get clean 

RUN echo "-----BEGIN PGP PUBLIC KEY BLOCK-----mQINBGHe0SkBEADd5u7XBExxSg6stILhfNTNfhtTQ3ZSTLW0JZrni1inMS+P8aEM/GxtoK4+4LkLvbAiGkj7f6HEfKVuKUGN+RsHzpClEgyEZ4IY/Na37vJa+XE/zmNZMbcyHGl5wV8flKHEl/tMAjPV/TUKfePqiyabHjNaZm3AGRGi0oxH2IL3vTOl5DbVsl1oMkfr0h5w4mZkAJqszGxt1nPVA8mn4a57kFJrxwDQX2LnyZWPG+0xIikg91Rzeffa+VNh58bi5WPtHwBv9c8bHNjKi66CxK6DWISqLAO/IPpvyG0RRuju18tFQ1dU2ZPI6R9+u6I4aEP2epfZI7b5n7MBLrSrDY95X3NxWhDdJeYaLwllQNi9NdBlGwrEi2q/NWvmkcHzByY7XfAuOzX08x0Z+fmghCh17dcZAtSzcihZKLDov+gyrbEJfT8GmfKS3NVU28giPa1mZat8JzDem44j2YXBJMxevz0/smTxJmx/69sH9lMRN0QCfnBEvFUGN2NJVbfoiuKzAdwz3FPJZP9n7iSXt4onab16J2i2GalRkL11SY8NbfbAAnhbuiBOQXt103yGh9NMxoyblV+d9dX+m/r5K/uby55rx3KiRxzVFNPNRjkU5kdOvc6HTSKKFD8jqoOIc3/q50Ty3Ga4Ny3Ke4CsYwnVVfJcI+VLt3ebdPuc4yneDwARAQABtCBNZWdhTGltaXRlZCA8c3VwcG9ydEBtZWdhLmNvLm56PokCVAQTAQoAPhYhBLAcgRiASAyFTHPsfhpmS3hwlKSCBQJh3tEpAhsDBQkSzAMABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEBpmS3hwlKSC2RIP/2/gBmdhW7MGiANE04kVKQBxKpsoFct+qlr5Hzf3cuHVjtuSm7gv0swYXIr/WVxxpjFK7ipBV1XJIo5QJADTYIJQIFq0j31N6NTPQpPPrA2vxAuFlSBn6MIfKZUZmSddCuv10rA8g1e8V7VnY+Q3VYOVo+aBToXIsDl8zXHlPElm067CnEbfrMlu1YHQghjPGlB3GHfdxeI/WwdAq00It5101KLqhqILscsqWHUYFA2kUJGGY74uLKXnfnfzcsU4RMgTFBGqVwPBWLz7wPdxmq/jP7eVdHrNU882Csn5ZJZKHp/zznBAIUVCcTMs5l7FdPGu6dSgzj7QRx+bBNtc+4HSpdKL8ky23BsLMpBaRP71LPXajtJzb32rhzqDP2LKIIKytKsK2S/t8fyeZhp/xlKJ0QYgxnsKOYBZ3hmaYmIDmaxKvvc6UwPKqJiCvumPyTBwLLo0hz++pBAw4qh9ZaJL0+ReJjutX35E+uIsJqOcMGOKT03XMtRa0ByfG5gV7SjsHkxf3Z75BMAJE0gmYOQUqq8zLUhV5ukiHfsWoVhZuTmv4pQJCxC4D3cnJlKKOAM0vZgL9ir0esyd5tvCchtjSphzRi/ODMB+T4GF1w1QUjRsKiJROMY9lWG48JYim7ZeAtOYEsA90zP6KDIs104++KrzGUj7Nwy724hPw18ZuQINBGHe0SkBEAC7MvXFkM08aI0zSSLyB1ABEEJ+PbvGhLFLhieKf8a7uD4Q6Ddd+ctVNVEZzB90DuhU9RppUry6xlm3yCnSNIdxGBmHzyYL9Ic1HNGfzot/zpAs4Gbddqikfrn+zjkrYCKoIogjmyV1GF5Hx1A2JG4E3wyLRQ6I2OnHacGvP2OilUQx9MY1rcfsCw3Tyc4pRIRQqGN9cuUTM1TQk86SECTfTdYT+vbBTHWI48FtudVlm11/Hbc8p25fqR8ogky2F9o8a0KZzCVlAFnSj+JGsP15OEx+Vz4ZXjckXARQT91DfwsnPyfUe6K47ZJNWEiNNevCnE0v+0LgCJWBP2yeB/47D1graJIw/tbDZs18XLbxJuRNQJX/nhuVWF/Ickfv07HySMThBQH4yEudc/ZIH+hMjZdqj2MuYbHlO412bX0rj5HuKZ0SAr00IhdF9RX1K/wKXY3apYOPi1mr/VAB6Mx1zt8V4wXzQAXgr1N4Gz83YLWWv/48XRbjuBCqQkRfs48lW15BKDaJaly3VyymrYVVXTSdKNkX3+BXP25TG2/RppYhAftHVb7ptU+CiycmCuT9OvG+xv+YGliqiEjE0Qy0hdgHngqt42UzHSd/xqrOFTPMTAl1BDgFiMwwIH+JeYbpJ1ohKBaDMMG7IU4sp6YlIRj6iFeZCkwWjU7WzIqtvwARAQABiQI8BBgBCgAmFiEEsByBGIBIDIVMc+x+GmZLeHCUpIIFAmHe0SkCGwwFCRLMAwAACgkQGmZLeHCUpIIdohAA3c2/oLlrPTKEPCSlHvQYDpvTBQjdQ9GY20pPHDom/T26qO5v36+vFfI47Z3uz8RX2vn83CEE467IjvGE3AyMp4cBODWgJJgGWx8yH8ueR1Qk9AAZ/VZ8zD0rQ34Sk0uVl7voosJ5cH2hwdy6xXjR2dfFb1+wLjpi+Bdy3RU69Y2D7H8Okut8PpRgbd+u9JnK0+U0rzMJUICRIFC1NI8zaAw+ZpSTlTpY622vp8ynkTk6TZ2D9e8yM70L/lwza5rloHi7NdCxEjly/O0JAON6if1kPbnteOUc8pll57bPWxhUOnpcawDZa7i7E6WaN84gabnGE6l3DIGTp8Iatq+oT4mKDWLKotjAZsdccUmxLqfMKHl8gjkxjyGlD85QdCKms5zZIzUXnO/0HKs7+vSmRaK5xaD62M2Lh6q3it344NjV37v9Ofs2KroNovwfRBcjImblNv0DLERFeEIfzNJ4P9NsAW7PvnemmTa7cc5kmtaxBYi5ZPR9l3A5kWv2BlhFV8jZF328eh+KgLKdRJPRIK6z7NU7yHABcqHV7UnrSsJ2fzCOSOWULzW1ZhAGCP1I/kldxm1t5uzr0msZ9VFGlHYSkIAwBcys/xZLk+MVzXxJfRv+9viXL/SoNitOsh8ZUs3SjvJTVhxFDpAmGvNb3+jv3pNVU77SsAdVa6xer/c==F8S0-----END PGP PUBLIC KEY BLOCK-----" | apt-key add -

RUN sh -c "echo deb [arch=amd64,allow-insecure=yes] https://mega.nz/linux/repo/xUbuntu_${RELEASE}/ ./" >> /etc/apt/sources.list
RUN apt-get update \
    && apt-get -y --no-install-recommends install megacmd \ 
    && apt-get clean

RUN groupadd -g ${PGID} ${GROUP} && useradd -u ${PUID} ${USER} && usermod -g ${GROUP} ${USER} && usermod -G root ${USER} && usermod -g sudo ${USER}
RUN echo ${USER} 'ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/${USER}/
COPY ./fix_permissions.sh ./fix_permissions.sh
COPY ./megacmd_start.sh ./megacmd_start.sh
RUN chmod +x fix_permissions.sh
RUN chmod +x megacmd_start.sh

CMD ./megacmd_start.sh
