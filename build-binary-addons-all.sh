#!/bin/bash

# Builds Kodi binary addons.
# Uses Kodi standard repository for binary addons.
# Note that Libretro cores are not compiled by this script.

# Configure Kodi standard repository for binary addons.
repofname="/home/kodi/kodi-source/cmake/addons/bootstrap/repositories/binary-addons.txt"
bin_addons_repo="binary-addons https://github.com/xbmc/repo-binary-addons.git master"
rm -f $repofname
echo $bin_addons_repo >> $repofname

# Build the addons
cd /home/kodi/kodi-source
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi
