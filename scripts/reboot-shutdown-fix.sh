#!/usr/bin/env bash

set -e

###############################################################################
# Prevent non-root to reboot/shutdown
###############################################################################

NAME="Prevent non-root to reboot/shutdown"
MARKER="reboot-shutdown-fix"

###############################################################################

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo chmod 700 /sbin/reboot \
    && sudo chmod 700 /sbin/shutdown \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
