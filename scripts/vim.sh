#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Vim - the ubiquitous text editor
###############################################################################
# URL: https://www.vim.org/
###############################################################################

NAME="Vim"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends vim \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
