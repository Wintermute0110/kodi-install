#!/bin/bash

# Builds Kodi for X11.

mkdir -p /home/kodi/kodi-build
cd /home/kodi/kodi-build

cmake --build . -- -j8
