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
[ -z "${BAT_VERSION}" ] && BAT_VERSION=0.10.0

###############################################################################

BAT_URL=https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L ${BAT_URL} -o /tmp/bat_${BAT_VERSION}_amd64.deb \
    && sudo dpkg -i /tmp/bat_${BAT_VERSION}_amd64.deb \
    && rm /tmp/bat_${BAT_VERSION}_amd64.deb \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
