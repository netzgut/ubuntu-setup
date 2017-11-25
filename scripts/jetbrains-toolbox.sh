#!/usr/bin/env bash

set -e

NAME="JetBrains Toolbox"
MARKER="jetbrains-toolbox"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-${JETBRAINS_TOOLBOX_VERSION}.tar.gz -o /tmp/jbtb.tar.gz \
    && sudo tar xvfz /tmp/jbtb.tar.gz -C /opt/ \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
