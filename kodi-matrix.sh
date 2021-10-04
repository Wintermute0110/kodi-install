#!/bin/bash

# This wrapper script is used if you want to have a custom Kodi data directory.

# Mapped to special://home/, default is ~/.kodi
export KODI_DATA=/home/kodi/.kodi-matrix

# Execute Kodi
/home/kodi/bin-kodi-matrix/lib/kodi/kodi-x11
