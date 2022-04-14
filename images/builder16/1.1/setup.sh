#!/bin/bash

# set -e

CPU_THREADS=$(nproc)

FIRST_STARTUP="FIRST_STARTUP"
if [ ! -e /$FIRST_STARTUP ]; then
    touch /$FIRST_STARTUP
 
    cd /home
    tar -xvf toolchain.tar
    cd ./toolchain
    tar -xf Python-3.8.10.tgz
    cd Python-3.8.10
    ./configure --enable-optimizations
    make -j $CPU_THREADS
    make altinstall

    cd /home/toolchain
    tar -xvf Qualcomm.tar.gz
 
    cp -R Qualcomm/ /home

    mkdir -p /pkg/qct/software/llvm/release/arm/
    mkdir -p /pkg/qct/software/llvm/release/arm/3.9.2
    mkdir -p /pkg/qct/software/llvm/release/arm/8.0.9
    mkdir -p /pkg/qct/software/arm/linaro-toolchain/aarch64-none-elf/4.9-2014.07
    mkdir -p /pkg/sectools/v2/latest/Linux

    tar -xvf snapdragon_llvm_10.0.3.tgz
    rm -rf snapdragon_llvm_10.0.3.tgz
    cp -R /home/toolchain/10.0.3 /pkg/qct/software/llvm/release/arm

    cp Snapdragon-llvm-3.9.2-linux64.tar.gz /pkg/qct/software/llvm/release/arm/3.9.2
    cd /pkg/qct/software/llvm/release/arm/3.9.2
    tar -xvf Snapdragon-llvm-3.9.2-linux64.tar.gz
    rm -rf Snapdragon-llvm-3.9.2-linux64.tar.gz

    cd /home/toolchain
    cp Snapdragon-llvm-8.0.9-linux64.tar.gz /pkg/qct/software/llvm/release/arm/8.0.9
    cd /pkg/qct/software/llvm/release/arm/8.0.9
    tar -xvf Snapdragon-llvm-8.0.9-linux64.tar.gz
    rm -rf Snapdragon-llvm-8.0.9-linux64.tar.gz

    cd /home/toolchain
    tar -xpJf gcc-linaro-aarch64-linux-gnu-4.9-2014.07_linux.tar.xz
    cp -a gcc-linaro-aarch64-linux-gnu-4.9-2014.07_linux/. /pkg/qct/software/arm/linaro-toolchain/aarch64-none-elf/4.9-2014.07

    cp sectools /pkg/sectools/v2/latest/Linux

    cd /home

    dpkg-reconfigure dash

    rm /bin/sh
    ln -s /bin/bash /bin/sh

    rm -rf /home/toolchain

    /usr/bin/ccache -M 10G

    /bin/bash
else
    # script that should run the rest of the times (instances where you 
    # stop/restart containers).

    /bin/bash
fi
