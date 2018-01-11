#!/usr/bin/env bash

set -e

NAME="Misc"
MARKER="misc"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        gtk2-engines-pixbuf \
        mysql-client \
        mc \
    && gsettings set org.gnome.desktop.background show-desktop-icons false \
    && gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
