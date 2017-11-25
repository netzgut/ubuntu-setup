#!/usr/bin/env bash

set -e

NAME="ZSH/oh-my-zsh/powerlevel9k"
MARKER="zsh"

echo "Trying to install $NAME"

if [ ! -f ~/.idempotent/$MARKER ]; then
    sudo apt-get install -y  zsh \
    && if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi \
    && git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline \
    && bash /tmp/powerline/install.sh \
    && rm -rf /tmp/powerline \
    && git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k \
    && chsh -s /bin/zsh \
    && date > ~/.idempotent/zsh \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi