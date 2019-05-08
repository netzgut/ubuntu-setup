#!/usr/bin/env bash

set -e

###############################################################################
# OpenJDK 11 via ppa:openjdk-r/ppa
###############################################################################
# URL: https://launchpad.net/~openjdk-r/+archive/ubuntu/ppa
###############################################################################

NAME="OpenJDK 11"
MARKER="openjdk11"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository ppa:openjdk-r/ppa \
    && sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        openjdk-11-jdk \
        openjdk-11-doc \
        openjdk-11-source \
        openjfx \
        openjfx-source \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished install $NAME"
else
    echo "$NAME is already installed"
fi
