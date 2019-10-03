#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Enable Backlight Support for XPS 9560
###############################################################################
# URL: https://wiki.archlinux.org/index.php/Dell_XPS_15_9560
###############################################################################

NAME="Backlight (XPS 9560)"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends xbacklight \
    && echo "Section \"Device\"
	Identifier \"card0\"
	Driver \"intel\"
	Option \"Backlight\" \"intel_backlight\"
	BusID \"PCI:0:2:0\"
EndSection" | sudo tee /usr/share/X11/xorg.conf.d/20-intel.conf \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
