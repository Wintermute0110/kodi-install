#!/bin/bash

# Install Kodi into local directory.

source configuration.sh
echo "Kodi source directory  $KODI_SOURCE_DIR"
echo "Kodi build directory   $KODI_BUILD_DIR"
echo "Kodi install directory $KODI_INSTALL_DIR"

cd $KODI_BUILD_DIR
make install
