#!/bin/bash

# Builds Kodi binary PVR 

# Configure Kodi standard repository for binary addons.
repofname="/home/kodi/kodi-source/cmake/addons/bootstrap/repositories/binary-addons.txt"
bin_addons_repo="binary-addons https://github.com/xbmc/repo-binary-addons.git master"
rm -f $repofname
# -n no trailing newline
echo -n $bin_addons_repo >> $repofname

# Build the addons
num_proc=`nproc`
echo "Using $num_proc processors"
cd /home/kodi/kodi-source

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="pvr.iptvsimple"
