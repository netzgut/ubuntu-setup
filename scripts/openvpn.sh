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
