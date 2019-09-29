#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# OpenJDK 11 via ppa:openjdk-r/ppa
###############################################################################
# URL: https://launchpad.net/~openjdk-r/+archive/ubuntu/ppa
###############################################################################

NAME="OpenJDK 11 (+openjfx)"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository ppa:openjdk-r/ppa \
    && sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        openjdk-11-jdk \
        openjdk-11-doc \
        openjdk-11-source \
        openjfx \
        openjfx-source \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
