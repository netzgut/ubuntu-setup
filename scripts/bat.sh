#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Bat, a cat(1) clone with wings.
###############################################################################
# URL: https://github.com/sharkdp/bat
###############################################################################

NAME="Bat - a cat(1) clone with wings"

###############################################################################

# BAT_VERSION
[ -z "${BAT_VERSION}" ] && BAT_VERSION=0.15.0

###############################################################################

BAT_URL=https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb
BAT_TEMP_FILE="$(mktemp -u).deb"

###############################################################################

print_banner "$NAME" "VERSION=$BAT_VERSION"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    curl -L "$BAT_URL" -o "$BAT_TEMP_FILE" \
    && sudo dpkg -i "$BAT_TEMP_FILE" \
    && rm "$BAT_TEMP_FILE" \
    && finish_install "$MARKER" "BAT_VERSION=${BAT_VERSION}"
else
    already_installed "$MARKER"
fi
