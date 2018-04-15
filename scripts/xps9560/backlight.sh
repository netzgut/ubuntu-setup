#!/usr/bin/env bash

set -e

###############################################################################
# Enable Backlight Support for XPS 9560
###############################################################################
# URL: https://wiki.archlinux.org/index.php/Dell_XPS_15_9560
###############################################################################

NAME="Backlight (XPS 9560)"
MARKER="xps9560-backlight"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    echo "Section \"Device\"
	Identifier \"card0\"
	Driver \"intel\"
	Option \"Backlight\" \"intel_backlight\"
	BusID \"PCI:0:2:0\"
EndSection" | sudo tee /usr/share/X11/xorg.conf.d/20-intel.conf
    date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
