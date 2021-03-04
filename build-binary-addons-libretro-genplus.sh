#!/bin/bash

# Builds a single libretro core for testing of the build system.
# Uses special repository for game addons

# --- Define useful functions ---
compile_core () {
    echo "Compiling core $1..."
    cd ${KODI_SOURCE_DIR}
    rm -f ${control_file}
    make -j$num_proc -C tools/depends/target/binary-addons PREFIX=${KODI_INSTALL_DIR} ADDONS="$1"
}

# --- Configure Kodi repository for Libretro cores ---
source configuration.sh
repofname="${KODI_SOURCE_DIR}/cmake/addons/bootstrap/repositories/binary-addons.txt"
bin_addons_repo="binary-addons https://github.com/kodi-game/repo-binary-addons.git retroplayer"
rm -f $repofname
# -n no trailing newline
echo -n $bin_addons_repo >> $repofname
control_file="${KODI_SOURCE_DIR}/tools/depends/target/binary-addons/.installed-native"
echo "Control file ${control_file}"
num_proc=`nproc`
echo "Using $num_proc processors"

# --- Build the addons ---
compile_core game.libretro.genplus
