#!/bin/bash
#
# Install Kodi build dependencies for Debian unstable (October 2018).
#

# Install build tools (alphabetical order)
apt install \
    build-essential \
    autoconf \
    automake \
    autopoint \
    autotools-dev \
    ccache \
    clang-format \
    cmake \
    curl \
    debhelper \
    default-jre \
    doxygen \
    gawk \
    gdc \
    gettext \
    gperf \
    libtool \
    lsb-release \
    nasm \
    swig \
    unzip \
    yasm \
    zip

# Python 2 stuff (Leia)
# As of August 2020 Python 2 has been deprecated from Debian Unstable. Python 3 is the default.
apt install python2-dev python-pil

# Python 3 stuff (Matrix)
apt install python3-dev python3-pil python3-pip

# Install build libraries (alphabetical order)
# libavahi-compat-libdnssd-dev -> MDNS -> dns_sd.h (currently does not work, MDNS not found)
apt install \
    libasound2-dev \
    libass-dev \
    libavahi-client-dev \
    libavahi-common-dev \
    libavahi-compat-libdnssd-dev \
    libavahi-core-dev \
    libbluetooth-dev \
    libbluray-dev \
    libbz2-dev \
    libcap-dev \
    libcdio-dev \
    libcec-dev \
    libcrossguid-dev \
    libcurl4-openssl-dev \
    libcwiid-dev \
    libdav1d-dev \
    libdbus-1-dev \
    libegl1-mesa-dev \
    libenca-dev \
    libflac-dev \
    libflatbuffers-dev \
    libfontconfig-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libfstrcmp-dev \
    libfmt-dev \
    libgcrypt20-dev \
    libgif-dev \
    libgles2-mesa-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libgnutls28-dev \
    libgpg-error-dev \
    libgtest-dev \
    libiso9660-dev \
    libiso9660++-dev \
    libjpeg-dev \
    liblcms2-dev \
    liblirc-dev \
    libltdl-dev \
    liblzo2-dev \
    libmicrohttpd-dev \
    libmariadb-dev-compat \
    libmariadb-dev \
    libnfs-dev \
    libogg-dev \
    libpcre3-dev \
    libplist-dev \
    libpng-dev \
    libpulse-dev \
    libp8-platform-dev \
    libsmbclient-dev \
    libspdlog-dev \
    libsqlite3-dev \
    libssl-dev \
    libtag1-dev \
    libtiff5-dev \
    libtinyxml-dev \
    libudev-dev \
    libudfread-dev \
    libunistring-dev \
    libva-dev \
    libvdpau-dev \
    libvorbis-dev \
    libxmu-dev \
    libxrandr-dev \
    libxslt1-dev \
    libxt-dev \
    rapidjson-dev \
    uuid-dev \
    waylandpp-dev \
    wayland-protocols \
    zlib1g-dev
