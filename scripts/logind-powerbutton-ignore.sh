#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Ignore the power button and NOT shutdown immediatly
###############################################################################

NAME="logind: ignore power button"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo sed -i "s/#HandlePowerKey=.*/HandlePowerKey=ignore/g" /etc/systemd/logind.conf \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
