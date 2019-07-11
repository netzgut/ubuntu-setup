#!/usr/bin/env bash

set -e

###############################################################################
# rustup.rs - The Rust toolchain installer
###############################################################################
# URL: https://github.com/creationix/nvm
###############################################################################

NAME="rustup.rs (rustup)"
MARKER=rustup

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
