#!/bin/bash

# Builds Kodi binary addons except PVR addons.

cd /home/kodi/kodi-source
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="audiodecoder.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="audioencoder.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="game.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="imagedecoder.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="inputstream.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="peripheral.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="screensaver.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="vfs.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native

make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi ADDONS="visualization.*"
rm -f /home/kodi/kodi-source/tools/depends/target/binary-addons/.installed-native
