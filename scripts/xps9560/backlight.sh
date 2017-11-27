#!/usr/bin/env bash

set -e

NAME="Backlight (XPS 9560)"
MARKER="xps9560-backlight"

echo "Trying to install $NAME"
if [ ! -f ~/.idempotent/$MARKER ]; then
    echo "Section \"Device\"
	Identifier \"card0\"
	Driver \"intel\"
	Option \"Backlight\" \"intel_backlight\"
	BusID \"PCI:0:2:0\"
EndSection" | sudo tee /usr/share/X11/xorg.conf.d/20-intel.conf
    date > ~/.idempotent/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
