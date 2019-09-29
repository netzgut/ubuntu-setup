#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# rustup.rs - The Rust toolchain installer
###############################################################################
# URL: https://github.com/creationix/nvm
###############################################################################

NAME="rustup.rs (rustup)"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
