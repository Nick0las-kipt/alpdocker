#!/bin/bash

set -e

CCACHE_ENABLED=false

usage() {
	echo "usage: android_build_script.sh path/to/root/directory/of/android/sources [--ccache]"
	exit 1
}

case "$1" in
    -h)
        usage
    ;;
    *)
    ;;
esac

case "$2" in
    --ccache)
        CCACHE_ENABLED=true
    ;;
    *)
    ;;
esac

[[ $# -lt 2 ]] && usage

if [[ $CCACHE_ENABLED == true ]]; then
    export CCACHE_EXEC=/usr/bin/ccache
    export CCACHE_DIR=/home/ccache
    export USE_CCACHE=$CCACHE_ENABLED
fi

cd "$1"

# export OUT_DIR=out_mytarget
source build/envsetup.sh
lunch alpental-eng
make qfilpackage -j$(nproc)
