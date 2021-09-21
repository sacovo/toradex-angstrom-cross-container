#!/usr/bin/env sh

git clone https://github.com/NXPNFCLinux/linux_libnfc-nci.git
cd linux_libnfc-nci/ || exit
. /usr/local/oecore-x86_64/environment-setup-armv7at2hf-neon-angstrom-linux-gnueabi
./bootstrap
./configure --host=arm-angstrom-linux --prefix=/usr/local/oecore-x86_64/sysroots/armv7at2hf-neon-angstrom-linux-gnueabi/usr
make install
