#!/usr/bin/env bash

set -e

NAME="RCM"
MARKER="rcm"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm \
    && sudo apt-get update \
    && sudo apt-get install -y rcm \
    && git clone $DOTFILES_REPO ~/.dotfiles \
    && rcup \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished install $NAME"
else
    echo "$NAME is already installed"
fi