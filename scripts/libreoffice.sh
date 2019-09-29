#!/usr/bin/env bash

set -e

###############################################################################
# LibreOffice Free Office Suite
###############################################################################
# URL: https://www.libreoffice.org/
###############################################################################

NAME="LibreOffice"
MARKER="libreoffice"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get purge -y libreoffice* \
    && sudo add-apt-repository ppa:libreoffice/ppa \
    && sudo apt-get update \
    && sudo apt-get install -y libreoffice  \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
