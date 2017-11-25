#!/usr/bin/env bash

set -e

NAME="i3 Window Manager"
MARKER="i3wm"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb /tmp/keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f \
    && sudo dpkg -i /tmp/keyring.deb \
    && echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | sudo cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list \
    && sudo apt-get update \
    && sudo apt-get -y install \
        i3 \
        i3status \
        i3lock \
        unity-greeter-badges \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

