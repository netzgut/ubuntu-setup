#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# i3 Window Manager
###############################################################################
# URL: https://i3wm.org/
###############################################################################

NAME="i3 Window Manager"

###############################################################################

KEY_TEMP_FILE="$(mktemp -u).deb"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2020.02.03_all.deb $KEY_TEMP_FILE SHA256:c5dd35231930e3c8d6a9d9539c846023fe1a08e4b073ef0d2833acd815d80d48 \
    && sudo dpkg -i "$KEY_TEMP_FILE" \
    && rm "$KEY_TEMP_FILE" \
    && echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | sudo cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list \
    && sudo apt-get update \
    && sudo apt-get -y install \
        i3 \
        i3status \
        i3lock \
        unity-greeter-badges \
        rofi \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
