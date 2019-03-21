#!/usr/bin/env bash

set -e

###############################################################################
# i3 Window Manager
###############################################################################
# URL: https://i3wm.org/
###############################################################################

NAME="i3 Window Manager"
MARKER="i3wm"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb /tmp/keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416 \
    && sudo dpkg -i /tmp/keyring.deb \
    && echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | sudo cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list \
    && sudo apt-get update \
    && sudo apt-get -y install \
        i3 \
        i3status \
        i3lock \
        unity-greeter-badges \
        rofi \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

