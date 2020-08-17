#!/bin/bash

# Completely deletes the Kodi build directory

source configuration.sh
echo "Purging build directory ${KODI_BUILD_DIR}"
rm -rf ${KODI_BUILD_DIR}
