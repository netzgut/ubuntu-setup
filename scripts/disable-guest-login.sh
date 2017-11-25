#!/usr/bin/env bash

set -e

NAME="Disable Guest Login"
MARKER="disable-guest-login"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo sh -c 'printf "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf' \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

