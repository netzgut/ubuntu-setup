#!/usr/bin/env bash

set -e

NAME="Gitkraken"
MARKER="gitkraken"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://release.gitkraken.com/linux/gitkraken-amd64.deb -o /tmp/gitkraken.deb \
    && sudo dpkg -i /tmp/gitkraken.deb \
    && rm /tmp/gitkraken.deb \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi