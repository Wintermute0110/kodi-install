#!/bin/bash

# Cleans Kodi binary addons.

cd /home/kodi/kodi-source
make -C tools/depends/target/binary-addons PREFIX=/home/kodi/bin-kodi clean
