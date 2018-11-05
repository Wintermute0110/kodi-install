#!/bin/bash

# Install Kodi build dependencies for Debian unstable (October 2018).

mkdir -p /home/kodi/kodi-bin
mkdir -p /home/kodi/kodi-build
mkdir -p /home/kodi/kodi-source

# Install build tools
apt install build-essential debhelper \
    autoconf automake autopoint gettext autotools-dev cmake curl \
    default-jre doxygen gawk gdc gperf \
    lsb-release swig unzip yasm zip ccache

# Python stuff
apt install python-dev python-pil

# Install build libraries
apt install \
    libasound2-dev libass-dev libavahi-client-dev \
    libavahi-common-dev libbluetooth-dev libbluray-dev libbz2-dev libcdio-dev libp8-platform-dev \
    libcrossguid-dev libcurl4-openssl-dev libcwiid-dev libdbus-1-dev libegl1-mesa-dev libenca-dev \
    libflac-dev libfontconfig-dev libfreetype6-dev libfribidi-dev libfstrcmp-dev libgcrypt-dev \
    libgif-dev libgles2-mesa-dev libgl1-mesa-dev libglu1-mesa-dev libgnutls28-dev libgpg-error-dev \
    libiso9660-dev libjpeg-dev liblcms2-dev libltdl-dev liblzo2-dev libmicrohttpd-dev libmysqlclient-dev \
    libnfs-dev libogg-dev libpcre3-dev libplist-dev libpng-dev libpulse-dev \
    libsmbclient-dev libsqlite3-dev libssl-dev libtag1-dev libtiff5-dev libtinyxml-dev libtool \
    libudev-dev libva-dev libvdpau-dev libvorbis-dev libxmu-dev libxrandr-dev libxslt1-dev libxt-dev \
    rapidjson-dev uuid-dev zlib1g-dev
apt install libcec-dev libfmt-dev liblirc-dev
