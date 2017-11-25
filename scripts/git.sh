#!/usr/bin/env bash

set -e

NAME="Git"
MARKER="git"

REPO_HOME="$GIT_FLOW_REPO_HOME"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends \
        git \
        tig \
        meld \
    && wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh \
    && sudo bash gitflow-installer.sh install stable \
    && rm gitflow-installer.sh \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi