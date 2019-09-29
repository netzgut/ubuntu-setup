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

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    CHROME_TEMP_FILE="$(mktemp -u).deb"
    curl -o $CHROME_TEMP_FILE https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && (sudo dpkg -i $CHROME_TEMP_FILE || true) \
    && sudo apt-get -y -f install \
    && rm $CHROME_TEMP_FILE \
    && date > $MARKER_DIRECTORY/$MARKER \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
