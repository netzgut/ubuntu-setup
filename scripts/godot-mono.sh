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
[ -z "${GODOT_VERSION}" ] && GODOT_VERSION=3.1.1

###############################################################################

GODOT_PATH="/opt/"
GODOT_NAME="Godot_v${GODOT_VERSION}-stable_mono_x11_64"
GODOT_EXEC="Godot_v${GODOT_VERSION}-stable_mono_x11.64"
GODOT_MONO_URL=https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/mono/${GODOT_NAME}.zip
GODOT_TEMP_FILE="$(mktemp -u).zip"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt install gnupg ca-certificates \
    && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list \
    && sudo apt update \
    && sudo apt install -y --no-install-recommends mono-devel \
    && curl -L ${GODOT_MONO_URL} -o $GODOT_TEMP_FILE \
    && sudo unzip $GODOT_TEMP_FILE -d $GODOT_PATH \
    && rm $GODOT_TEMP_FILE \
    && mkdir -p $HOME/bin \
    && ln -s ${GODOT_PATH}/${GODOT_NAME}/${GODOT_EXEC} $BIN_DIRECTORY/godot \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
