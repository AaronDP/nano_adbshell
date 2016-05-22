#!/bin/sh
DEV_PREFIX=/opt
ANDROID_NDK=${DEV_PREFIX}/ndk
CROSS_COMPILE=arm-linux-androideabi
ANDROID_PREFIX=/tmp/chain
SYSROOT=${ANDROID_NDK}/platforms/android-17/arch-arm
CROSS_PATH=${ANDROID_PREFIX}/bin/${CROSS_COMPILE}
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export RANLIB=${CROSS_PATH}-ranlib
PREFIX=${DEV_PREFIX}/output
PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CFLAGS="-static -UHAVE_LOCALE_H --sysroot=${SYSROOT} -I${SYSROOT}/usr/include -I${ANDROID_PREFIX}/include -I${DEV_PREFIX}/android/bionic -I/data/local/tmp/lib/include"
export CPPFLAGS="${CFLAGS}"
#export LDFLAGS="${LDFLAGS} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib/libncurses.a"
export LDFLAGS="${LDFLAGS} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib"
./configure --host=arm-unknown-none --prefix=${PREFIX} CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" "$@"
