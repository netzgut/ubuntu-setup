#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# ZSH Shell with Oh My ZSH
###############################################################################
# URL: http://ohmyz.sh/
###############################################################################

NAME="ZSH with Oh My ZSH"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo apt-get install -y  zsh \
    && if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi \
    && chsh -s /bin/zsh \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
