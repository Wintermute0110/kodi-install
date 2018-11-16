#!/bin/bash

# Builds Kodi binary addons except PVR addons.
# Uses Kodi standard repository for binary addons.

# Configure Kodi standard repository for binary addons.
repofname="/home/kodi/kodi-source/cmake/addons/bootstrap/repositories/binary-addons.txt"
bin_addons_repo="binary-addons https://github.com/xbmc/repo-binary-addons.git master"
rm -f $repofname
echo $bin_addons_repo >> $repofname

# Build the addons
num_proc=`nproc`
echo "Using $num_proc processors"
cd /home/kodi/kodi-source

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="audiodecoder.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="audioencoder.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="game.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="imagedecoder.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="inputstream.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="peripheral.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="screensaver.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="vfs.*"

rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
make -j$num_proc -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="visualization.*"
