#!/bin/bash
source configuration.sh
current_dir=`pwd`
echo "Current directory $current_dir"
echo "Kodi source directory $KODI_SOURCE_DIR"
cd $KODI_SOURCE_DIR
git checkout master
git pull --all
cd $current_dir
