#!/bin/bash
DEV_PREFIX=/opt
ANDROID_NDK=${DEV_PREFIX}/ndk
CROSS_COMPILE=arm-linux-androideabi
ANDROID_PREFIX=/tmp/chain
SYSROOT=${ANDROID_NDK}/platforms/android-19/arch-arm
CROSS_PATH=${ANDROID_PREFIX}/bin/${CROSS_COMPILE}
CPP=${CROSS_PATH}-cpp
AR=${CROSS_PATH}-ar
AS=${CROSS_PATH}-as
NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
CXX=${CROSS_PATH}-g++
LD=${CROSS_PATH}-ld
RANLIB=${CROSS_PATH}-ranlib
PREFIX=${DEV_PREFIX}/android-bin
PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
CFLAGS="-UHAVE_LOCALE_H --sysroot=${SYSROOT} -I/data/local/tmp/lib/include -I${SYSROOT}/usr/include -I${ANDROID_PREFIX}/include -I${DEV_PREFIX}/android/bionic"
CPPFLAGS="${CFLAGS}"
LDFLAGS="${LDFLAGS} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib/"
refresh_nano() {
# Nano 2.2.6 build
# mkdir nano-2.2.6 2>/dev/null
# wget http://www.nano-editor.org/dist/v2.2/nano-2.2.6.tar.gz -O- | tar zxvf -
# cd nano-2.2.6/
# Patch to get around bionic deficiencies
./configure --enable-all --host=arm-linux-gnueabi LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}" CPPFLAGS="${CPPFLAGS}" && make -j3
#===========================================================================================================================
if [ -x src/nano ];then
  echo "Done building nano "
else
  echo Build failed.
fi
#adb push src/nano /data/local/tmp/xbin
#adb push profile /data/local/tmp/xbin/.profile
#adb shell chmod 777 /data/local/tmp/xbin/.profile
#sed -f nanotheme nanorc/lua.nanorc > nanorc.themed/lua.nanorc
#adb push nanorc.themed/lua.nanorc /data/local/tmp/xbin/share.nano/lua.nanorc
#adb push nanorc/default.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/ini.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/java.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/json.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/markdown.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/python.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/shell.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/sql.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/vi.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/xml.nanorc /data/local/tmp/xbin/share.nano/
#adb push nanorc/yaml.nanorc /data/local/tmp/xbin/share.nano/
#tar cvf terminfo.tar -C /lib terminfo/
#adb push terminfo.tar /data/local/tmp/xbin
#adb shell cd /data/local/tmp/xbin; ./busybox tar xf terminfo.tar 
# Check whether --enable-dependency-tracking was given.
# Check whether --enable-largefile was given.
# Check whether --enable-rpath was given.
# Check whether --enable-nls was given.
# Check whether --enable-debug was given.
# Check whether --enable-tiny was given.
# Check whether --enable-extra was given.
# Check whether --enable-browser was given.
# Check whether --enable-help was given.
# Check whether --enable-justify was given.
# Check whether --enable-mouse was given.
# Check whether --enable-operatingdir was given.
# Check whether --enable-speller was given.
# Check whether --enable-tabcomp was given.
# Check whether --enable-wrapping was given.
# Check whether --enable-wrapping-as-root was given.
# Check whether --enable-color was given.
# Check whether --enable-multibuffer was given.
# Check whether --enable-nanorc was given.
# Check whether --enable-all was given.
# Check whether --enable-utf8 was given.
# Check whether --enable-altrcname was given.
# Check whether --enable-glibtest was given.
