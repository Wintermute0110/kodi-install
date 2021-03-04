#!/bin/bash

# Builds all Kodi binary addons. Note that Libretro cores are not compiled by this script.
# Uses Kodi standard repository for binary addons.
source configuration.sh

# Configure Kodi standard repository for binary addons.
repofname="${KODI_SOURCE_DIR}/cmake/addons/bootstrap/repositories/binary-addons.txt"
bin_addons_repo="binary-addons https://github.com/xbmc/repo-binary-addons.git master"
rm -f $repofname
# -n no trailing newline
echo -n $bin_addons_repo >> $repofname
control_file="${KODI_SOURCE_DIR}/tools/depends/target/binary-addons/.installed-native"
echo "Control file ${control_file}"

# Build the addons
num_proc=`nproc`
echo "Using $num_proc processors"
cd ${KODI_SOURCE_DIR}
rm -f ${control_file}
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=${KODI_INSTALL_DIR}
