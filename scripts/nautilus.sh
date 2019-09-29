#!/usr/bin/env bash

set -e

###############################################################################
# Gnome File Manager (formerly Nautilus)
###############################################################################
# URL: https://gitlab.gnome.org/GNOME/nautilus
###############################################################################

NAME="Nautilus File Manager (with i3 fix)"
MARKER="nautilus"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        nautilus \
    && gsettings set org.gnome.desktop.background show-desktop-icons false \
    && gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
