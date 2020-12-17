#!/bin/bash

# Creates build directory and configures Kodi build.

source configuration.sh
echo "Kodi source directory  $KODI_SOURCE_DIR"
echo "Kodi build directory   $KODI_BUILD_DIR"
echo "Kodi install directory $KODI_INSTALL_DIR"

# Create build directory.
mkdir -p $KODI_BUILD_DIR
cd $KODI_BUILD_DIR

cmake $KODI_SOURCE_DIR -DCMAKE_INSTALL_PREFIX=$KODI_INSTALL_DIR -DENABLE_INTERNAL_FLATBUFFERS=ON -DENABLE_INTERNAL_FMT=ON -DENABLE_INTERNAL_RapidJSON=ON
echo "Configuration finished."
echo "Kodi source directory  ${KODI_SOURCE_DIR}"
echo "Kodi build directory   ${KODI_BUILD_DIR}"
echo "Kodi install directory ${KODI_INSTALL_DIR}"
