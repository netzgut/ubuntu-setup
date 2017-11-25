#!/usr/bin/env bash

set -e

NAME="Touchpad (XPS 9560)"
MARKER=xps9560-touchpad

echo "Trying to install $NAME"

# TOUCHPAD
if [ ! -f ~/.idempotent/$MARKER ]; then
    sudo apt-get install xserver-xorg-input-libinput \
    && sudo apt-get remove --purge xserver-xorg-input-synaptics \
    && date > ~/.idempotent/xps-9560-touchpad \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi