#!/bin/bash

set -e

CCACHE_ENABLED=false
ANDROID_DIR=""

set_nproc () {
    less /proc/meminfo | grep MemTotal: > ./nproc_tmp
    local N_PROC=$(cut -d ':' -f 2 ./nproc_tmp | tr -cd [:digit:])
    rm -f ./nproc_tmp
    N_PROC=$((N_PROC/2097152+1))

    if [[ $N_PROC -lt 1 ]]; then
        N_PROC=1;
    fi

    echo $N_PROC
}

usage() {
	echo "usage: android_build.sh [-d path/to/root/directory/of/android/sources] [-c] [-h]"
	exit 1
}

while getopts 'hcd:' OPTION; do
  case "$OPTION" in
    c)
      CCACHE_ENABLED=true
      ;;
    h)
      usage
      ;;
    d)
      ANDROID_DIR=$OPTARG
      echo "Android directory path is $OPTARG"
      ;;
    ?)
      usage
      exit 1
      ;;
  esac
done
shift "$(($OPTIND-1))"

if [[ $CCACHE_ENABLED == true ]]; then
    export CCACHE_EXEC=/usr/bin/ccache
    [[ ! -d "$ANDROID_DIR/ccache" ]] && mkdir -p "$ANDROID_DIR/ccache"
    export CCACHE_DIR="$ANDROID_DIR/ccache"
    export USE_CCACHE=$CCACHE_ENABLED
    echo "ccache has been enabled"
fi

cd "$ANDROID_DIR"

echo "Count of threads is $(set_nproc)"

# export OUT_DIR=out_docker

source build/envsetup.sh
lunch alpental-eng
make qfilpackage -j$(set_nproc)
