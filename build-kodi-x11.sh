#!/bin/bash

# Builds Kodi for X11.

num_proc=`nproc`
echo "Using $num_proc processors"
mkdir -p /home/kodi/kodi-build
cd /home/kodi/kodi-build
cmake --build . -- -j$num_proc
