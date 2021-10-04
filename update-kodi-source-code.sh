#!/bin/bash
source configuration.sh
current_dir=`pwd`
echo "Current directory $current_dir"
echo "Kodi source directory $KODI_SOURCE_DIR"
cd $KODI_SOURCE_DIR
# Restore this file. Otherwise `git checkout` will fail because local changes
# will be overwritten error. It is safe to execute `git restore` multiple times.
git restore cmake/addons/bootstrap/repositories/binary-addons.txt
git checkout master
git pull --all
cd $current_dir
