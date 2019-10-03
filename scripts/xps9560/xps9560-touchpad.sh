#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Fix Touchpad XPS 9560
###############################################################################
# URL: https://wiki.archlinux.org/index.php/Dell_XPS_15_9560
###############################################################################

NAME="Touchpad (XPS 9560)"

###############################################################################

print_banner "$NAME"

# TOUCHPAD
if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install xserver-xorg-input-libinput \
    && sudo apt-get remove --purge xserver-xorg-input-synaptics \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
