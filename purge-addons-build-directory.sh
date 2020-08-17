#!/bin/bash

# Completely deletes the addons build directory inside the Kodi source directory.

source configuration.sh
CONTROL_FILE=${KODI_SOURCE_DIR}/tools/depends/target/binary-addons/.installed-native
BIN_ADDON_DIR=${KODI_SOURCE_DIR}/tools/depends/target/binary-addons/native/
echo "Removing control file    ${CONTROL_FILE}"
rm -rf ${CONTROL_FILE}
echo "Removing addon build dir ${BIN_ADDON_DIR}"
rm -rf ${BIN_ADDON_DIR}
