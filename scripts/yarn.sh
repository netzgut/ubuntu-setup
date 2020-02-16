#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Yarn Dependency Management Tool
###############################################################################
# URL: https://yarnpkg.com/en/
###############################################################################

NAME="Yarn Package Manager"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY/""$MARKER" ]; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && sudo apt-get update \
    && sudo apt-get install --no-install-recommends yarn \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
