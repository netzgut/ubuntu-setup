#!/usr/bin/env bash

set -e

NAME="LibreOffice"
MARKER="libreoffice"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get purge -y libreoffice* \
    && sudo add-apt-repository ppa:libreoffice/ppa \
    && sudo apt-get update \
    && sudo apt-get install -y libreoffice  \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

