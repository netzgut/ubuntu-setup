#!/usr/bin/env bash

set -e

NAME="Google Chrome"
MARKER="chrome"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -o /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && (sudo dpkg -i /tmp/chrome.deb || true) \
    && sudo apt-get -y -f install \
    && rm /tmp/chrome.deb \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
