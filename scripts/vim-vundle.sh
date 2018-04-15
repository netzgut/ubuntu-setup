#!/usr/bin/env bash

set -e

###############################################################################
# Vim - the ubiquitous text editor
###############################################################################
# URL: https://www.vim.org/
###############################################################################

NAME="Vim"
MARKER="vim"

###############################################################################

echo "Trying to install $NAME"
if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends vim \
    && mkdir -p ~/.vim/bundle/ \
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
