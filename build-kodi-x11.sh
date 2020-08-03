#!/bin/bash

# Builds Kodi for X11.

source configuration.sh
num_proc=`nproc`
echo "Using $num_proc processors"
cd $KODI_BUILD_DIR
cmake --build . -- -j$num_proc
