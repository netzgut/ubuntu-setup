#!/usr/bin/env bash

# See: https://github.com/butteff/Ubuntu-Telemetry-Free-Privacy-Secure/blob/master/ubuntu_secure.sh
set -e

NAME="Improve Privacy"
MARKER="improve-privacy"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get -y purge \
        unity-lens-shopping \
        unity-webapps-common \
        apturl \
        zeitgeist \
        zeitgeist-datahub \
        zeitgeist-core \
        zeitgeist-extension-fts \
        unity8* \
    && sudo apt-get -y autoremove \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi