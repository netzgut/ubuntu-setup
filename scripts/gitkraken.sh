#!/usr/bin/env bash

set -e

###############################################################################
# Gitkraken Git GUI Client
###############################################################################
# URL: https://www.gitkraken.com/
###############################################################################

NAME="Gitkraken"
MARKER="gitkraken"

###############################################################################

GITKRAKEN_TEMP_FILE="$(mktemp -u).deb"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://release.gitkraken.com/linux/gitkraken-amd64.deb -o $GITKRAKEN_TEMP_FILE \
    && sudo dpkg -i $GITKRAKEN_TEMP_FILE \
    && rm $GITKRAKEN_TEMP_FILE \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi