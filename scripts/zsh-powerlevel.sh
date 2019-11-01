#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# ZSH Theme Powerlevel 9k with Powerline font
###############################################################################
# URL: http://ohmyz.sh/
###############################################################################

NAME="ZSH Powerlevel 9k theme"

###############################################################################

# THEME_DIR
[ -z "${THEME_DIR}" ] && THEME_DIR="powerlevel9k"

# THEME_GIT
[ -z "${THEME_GIT}" ] && THEME_GIT="https://github.com/bhilburn/powerlevel9k.git"

###############################################################################

print_banner "$NAME" "THEME_DIR=$THEME_DIR" "THEME_GIT=$THEME_GIT"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline \
    && bash /tmp/powerline/install.sh \
    && rm -rf /tmp/powerline \
    && git clone $THEME_GIT $HOME/.oh-my-zsh/custom/themes/$THEME_DIR \
    && finish_install $MARKER "THEME_DIR=$THEME_DIR" "THEME_GIT=$THEME_GIT"
else
    already_installed "THEME_DIR=$THEME_DIR" "THEME_GIT=$THEME_GIT"
fi
