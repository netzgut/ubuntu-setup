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
[ -z "${THEME_DIR}" ] && THEME_DIR="powerlevel9k"

# THEME_GIT
[ -z "${THEME_GIT}" ] && THEME_GIT="https://github.com/bhilburn/powerlevel9k.git"

###############################################################################

print_banner "$NAME" "THEME_DIR=$THEME_DIR" "THEME_GIT=$THEME_GIT"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y  zsh \
    && if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi \
    && git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline \
    && bash /tmp/powerline/install.sh \
    && rm -rf /tmp/powerline \
    && git clone $THEME_GIT $HOME/.oh-my-zsh/custom/themes/$THEME_DIR \
    && chsh -s /bin/zsh \
    && finish_install $MARKER "GOLANG_VERSION=$GOLANG_VERSION"
else
    already_installed "THEME_DIR=$THEME_DIR" "THEME_GIT=$THEME_GIT"
fi
