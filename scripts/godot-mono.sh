#!/usr/bin/env bash

set -e

###############################################################################
# Godot 3.0 Game engine with Mono Support
###############################################################################
# URL: https://godotengine.org/
###############################################################################

NAME="Godot with Mono-Support"
MARKER="godot-mono"

###############################################################################

# GODOT_VERSION
[ -z "${GODOT_VERSION}" ] && GODOT_VERSION=3.0.2

###############################################################################

GODOT_PATH="/opt/godot-${GODOT_VERSION}"
GODOT_NAME="Godot_v${GODOT_VERSION}-stable_mono_x11_64"
GODOT_MONO_URL=https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/mono/${GODOT_NAME}.zip

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L ${GODOT_MONO_URL} -o /tmp/${GODOT_NAME}.zip \
    && sudo unzip /tmp/${GODOT_NAME}.zip -C $GODOT_PATH \
    && mkdir -p $HOME/bin \
    && ln -s ${GODOT_PATH}/${GODOT_NAME} $BIN_DIRECTORY/godot \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
