#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Vim Vundle Plugin system
###############################################################################
# URL: https://github.com/VundleVim/Vundle.vim
###############################################################################

NAME="Vim Vundle"

###############################################################################

print_banner "$NAME" "GOLANG_VERSION=$GOLANG_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    mkdir -p ~/.vim/bundle/ \
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
