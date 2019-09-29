#!/usr/bin/env bash

set -e

###############################################################################
# Improving Ubuntu Privacy
###############################################################################
# URL: https://github.com/butteff/Ubuntu-Telemetry-Free-Privacy-Secure/blob/master/ubuntu_secure.sh
###############################################################################

NAME="Improve Privacy"
MARKER="improve-privacy"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get -y purge \
        unity-lens-shopping \
        unity-webapps-common \
        apturl \
        popularity-contest \
        zeitgeist \
        zeitgeist-datahub \
        zeitgeist-core \
        zeitgeist-extension-fts \
        unity8* \
    && sudo apt-get -y autoremove \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
