#!/bin/bash

# Completely deletes the Kodi build directory

source configuration.sh
echo "Purging build directory ${KODI_INSTALL_DIR}"
rm -rf ${KODI_INSTALL_DIR}
