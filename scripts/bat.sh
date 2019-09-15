#!/usr/bin/env bash

set -e

###############################################################################
# Bat, a cat(1) clone with wings.
###############################################################################
# URL: https://github.com/sharkdp/bat
###############################################################################

NAME="Bat, a cat replacement"
MARKER="bat"

###############################################################################

# BAT_VERSION
[ -z "${BAT_VERSION}" ] && BAT_VERSION=0.12.1

###############################################################################

BAT_URL=https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb
BAT_TEMP_FILE="$(mktemp -u).deb"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L $BAT_URL -o $BAT_TEMP_FILE \
    && sudo dpkg -i $BAT_TEMP_FILE \
    && rm $BAT_TEMP_FILE \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
