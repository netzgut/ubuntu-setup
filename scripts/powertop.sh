#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Powertop
###############################################################################
# URL: https://wiki.archlinux.org/index.php/Powertop
###############################################################################

NAME="Powertop"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo apt install -y \
        powertop \
    && echo "[Unit]
Description=Powertop tunings

[Service]
Type=exec
ExecStart=/usr/bin/powertop --auto-tune
RemainAfterExit=true

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/powertop.service \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
