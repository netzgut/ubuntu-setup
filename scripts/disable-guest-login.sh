#!/usr/bin/env bash

set -e

###############################################################################
# Disabled Guest Login in greeter
###############################################################################
# URL: http://ubuntuhandbook.org/index.php/2016/04/remove-guest-session-ubuntu-16-04/
###############################################################################

NAME="Disable Guest Login"
MARKER="disable-guest-login"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo sh -c 'printf "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf' \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

