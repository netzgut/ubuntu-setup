#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# OpenVPN
###############################################################################
# URL: https://openvpn.net/
###############################################################################

NAME="Open VPN"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        openvpn \
        network-manager \
        network-manager-openvpn \
        network-manager-openvpn-gnome \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
