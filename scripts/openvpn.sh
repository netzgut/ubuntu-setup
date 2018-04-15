#!/usr/bin/env bash

set -e

###############################################################################
# OpenVPN
###############################################################################
# URL: https://openvpn.net/
###############################################################################

NAME="Open VPN"
MARKER="openvpn"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        openvpn \
        network-manager \
        network-manager-openvpn \
        network-manager-openvpn-gnome \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

