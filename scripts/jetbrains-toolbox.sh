#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# JetBrains Toolbox
###############################################################################
# URL: https://www.jetbrains.com/toolbox/
###############################################################################

NAME="JetBrains Toolbox"

###############################################################################

# JETBRAINS_TOOLBOX_VERSION
[ -z "${JETBRAINS_TOOLBOX_VERSION}" ] && JETBRAINS_TOOLBOX_VERSION="1.17.7018"

###############################################################################

TOOLBOX_TEMP_FILE="$(mktemp -u).tar.gz"

###############################################################################

print_banner "$NAME" "JETBRAINS_TOOLBOX_VERSION=$JETBRAINS_TOOLBOX_VERSION"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    curl -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-${JETBRAINS_TOOLBOX_VERSION}.tar.gz -o "$TOOLBOX_TEMP_FILE" \
    && sudo tar xfz "$TOOLBOX_TEMP_FILE" -C /opt/ \
    && rm "$TOOLBOX_TEMP_FILE" \
    && finish_install "$MARKER" "JETBRAINS_TOOLBOX_VERSION=${JETBRAINS_TOOLBOX_VERSION}"
else
    already_installed "$MARKER"
fi
