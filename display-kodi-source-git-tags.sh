#!/bin/bash

# Displays tags in Kodi source code.

source configuration.sh
current_dir=`pwd`
echo "Current directory $current_dir"
echo "Kodi source directory $KODI_SOURCE_DIR"
git -C $KODI_SOURCE_DIR tag
