#!/bin/bash

# Builds Kodi for X11.

source configuration.sh
num_proc=`nproc`
echo "Using $num_proc processors"
cd $KODI_BUILD_DIR
cmake --build . -- -j$num_proc

echo "Kodi building finished."
echo "Kodi source directory  ${KODI_SOURCE_DIR}"
echo "Kodi build directory   ${KODI_BUILD_DIR}"
echo "Kodi install directory ${KODI_INSTALL_DIR}"
