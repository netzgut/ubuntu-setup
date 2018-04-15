#!/usr/bin/env bash

set -e

###############################################################################
# Gnome File Manager (formerly Nautilus)
###############################################################################
# URL: https://gitlab.gnome.org/GNOME/nautilus
###############################################################################

NAME="Nautilus File Manager"
MARKER="nautilus"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        nautilus \
    && gsettings set org.gnome.desktop.background show-desktop-icons false \
    && gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
