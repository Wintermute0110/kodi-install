#!/bin/bash

source configuration.sh
current_dir=`pwd`
echo "Current directory $current_dir"
echo "Kodi source directory $KODI_SOURCE_DIR"
echo "Kodi tag $KODI_SOURCE_TAG"
git -C $KODI_SOURCE_DIR checkout $KODI_SOURCE_TAG
