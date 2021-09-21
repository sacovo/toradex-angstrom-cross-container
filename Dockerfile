FROM ubuntu:16.04 as base

WORKDIR /app/

RUN apt-get update && apt-get upgrade

RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     pylint3 xterm automake autoconf libtool

RUN wget -nv https://developer.toradex.com/files/toradex-dev/uploads/media/Colibri/Linux/SDKs/2.8/colibri-imx7/angstrom-lxde-image/angstrom-glibc-x86_64-armv7at2hf-neon-v2017.12-toolchain.sh

RUN chmod +x angstrom-glibc-x86_64-armv7at2hf-neon-v2017.12-toolchain.sh

RUN ./angstrom-glibc-x86_64-armv7at2hf-neon-v2017.12-toolchain.sh -y

# Install nfc library

COPY install_nfc.sh .
RUN sh install_nfc.sh

COPY entrypoint.sh .

COPY scripts /usr/bin/

WORKDIR /src/

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["-Wall"]

RUN useradd toradex

USER toradex
