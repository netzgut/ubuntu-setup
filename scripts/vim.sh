#!/usr/bin/env bash

set -e

NAME="Vim"
MARKER="vim"

echo "Trying to install $NAME"
if [ ! -f ~/.idempotent/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends vim \
    && mkdir -p ~/.vim/bundle/ \
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && date > ~/.idempotent/vim \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
