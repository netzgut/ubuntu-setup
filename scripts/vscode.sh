#!/usr/bin/env bash

set -e

###############################################################################
# Visual Studio Code Editor
###############################################################################
# URL: https://code.visualstudio.com/
###############################################################################

NAME="Visual Studio Code"
MARKER="vscode"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && sudo apt-get update \
    && sudo apt-get install -y code \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
