#!/usr/bin/env bash

set -e

###############################################################################
# Prevent non-root to reboot/shutdown
###############################################################################

NAME="Prevent non-root to reboot/shutdown"
MARKER="reboot-shutdown-fix"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo chmod 700 /sbin/reboot \
    && sudo chmod 700 /sbin/shutdown \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
