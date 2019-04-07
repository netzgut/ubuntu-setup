#!/usr/bin/env bash

set -e

###############################################################################
# JetBrains Toolbox
###############################################################################
# URL: https://www.jetbrains.com/toolbox/
###############################################################################

NAME="JetBrains Toolbox"
MARKER="jetbrains-toolbox"

###############################################################################

# JETBRAINS_TOOLBOX_VERSION
[ -z "${JETBRAINS_TOOLBOX_VERSION}" ] && JETBRAINS_TOOLBOX_VERSION="1.14.5037"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-${JETBRAINS_TOOLBOX_VERSION}.tar.gz -o /tmp/jbtb.tar.gz \
    && sudo tar xvfz /tmp/jbtb.tar.gz -C /opt/ \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
