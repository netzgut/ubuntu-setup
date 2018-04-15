#!/usr/bin/env bash

set -e

###############################################################################
# ZSH Shell with Oh My ZSH and Powerline font
###############################################################################
# URL: http://ohmyz.sh/
###############################################################################

NAME="ZSH with Oh My ZSH"
MARKER="zsh"

###############################################################################

# THEME_DIR
[ -n "${THEME_DIR}" ] && THEME_DIR="powerlevel9k"

# THEME_GIT
[ -n "${THEME_GIT}" ] && THEME_GIT="https://github.com/bhilburn/powerlevel9k.git"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y  zsh \
    && if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi \
    && git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline \
    && bash /tmp/powerline/install.sh \
    && rm -rf /tmp/powerline \
    && git clone $THEME_GIT $HOME/.oh-my-zsh/custom/themes/$THEME_DIR \
    && chsh -s /bin/zsh \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi