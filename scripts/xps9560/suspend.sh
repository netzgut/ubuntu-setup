#!/usr/bin/env bash

set -e

NAME="Lock on Suspend (XPS 9560)"
MARKER="xps9560-lock"

echo "Trying to install $NAME"
if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    echo "[Unit]
Description=Lock·on Suspend
Before=sleep.target
 
[Service]
User=%I
Type=simple
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock -n -c 000000
ExecStartPost=/bin/sleep 1

[Install]
WantedBy=suspend.target" | sudo tee /etc/systemd/system/suspend@$USER.service
    sudo systemctl enable suspend@$USER.service \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
