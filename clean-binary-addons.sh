#!/bin/bash

# Cleans Kodi binary addons.

cd /home/kodi/kodi-source
make -j8 -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi clean
