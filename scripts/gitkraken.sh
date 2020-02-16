#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Gitkraken Git GUI Client
###############################################################################
# URL: https://www.gitkraken.com/
###############################################################################

NAME="Gitkraken"

###############################################################################

GITKRAKEN_TEMP_FILE="$(mktemp -u).deb"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    curl -L https://release.gitkraken.com/linux/gitkraken-amd64.deb -o "$GITKRAKEN_TEMP_FILE" \
    && sudo dpkg -i "$GITKRAKEN_TEMP_FILE" \
    && rm "$GITKRAKEN_TEMP_FILE" \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
