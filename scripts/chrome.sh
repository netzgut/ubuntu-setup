#!/usr/bin/env bash

set -e

###############################################################################
# Google Chrome
###############################################################################
# URL: https://www.google.com/chrome/
###############################################################################

NAME="Google Chrome"
MARKER="chrome"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    CHROME_TEMP_FILE="$(mktemp -u).deb"
    curl -o $CHROME_TEMP_FILE https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && (sudo dpkg -i $CHROME_TEMP_FILE || true) \
    && sudo apt-get -y -f install \
    && rm $CHROME_TEMP_FILE \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
