#!/usr/bin/env bash

set -e

NAME="Yarn Package Manager"
MARKER="yarn"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && sudo apt-get update \
    && sudo apt-get install --no-install-recommends yarn \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"

else
    echo "$NAME is already installed"
fi
