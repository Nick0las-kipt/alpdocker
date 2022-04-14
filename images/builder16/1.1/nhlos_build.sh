#!/bin/bash

set -e

usage() {
	echo "usage: nhlos_build.sh path/to/root/directory/of/source {boot_image | trust_zone | rpm | adsp}"
	exit 1
}

case "$1" in
    -h)
        usage
    ;;
    *)
    ;;
esac

[[ $# -lt 2 ]] && usage

export PYTHON_PATH=/usr/bin
export ARMTOOLS=LLVM
export HEXAGON_ROOT=/home/Qualcomm/HEXAGON_Tools
# export HEXAGON_RTOS_RELEASE=
export SECTOOLS=/pkg/sectools/v2/latest/Linux/sectools

case "$2" in
    boot_image)
        echo "Building boot_image"
        cd "$1/boot_images/QcomPkg/SocPkg/AthertonPkg"
        python ../../buildex.py --variant LAA -r RELEASE -t AthertonPkg,QcomToolsPkg

        exit 0
    ;;

    trust_zone)
        echo "Building trust_zone"
        cd "$1/trustzone_images/build/ms"
        python ./build_all.py -b TZ.XF.5.1 CHIPSET=atherton --config=build_config_deploy.xml -recompile

        exit 0
    ;;

    rpm)
        echo "Building rpm"
        cd "$1/rpm_proc/build"
        ./build_atherton.sh

        exit 0
    ;;

    adsp)
        echo "Building adsp"
        cd "$1/adsp_proc/build/ms"
        python ./build_variant.py atherton.adsp.prod

        exit 0
    ;;

    *)
        usage
    ;;
esac
