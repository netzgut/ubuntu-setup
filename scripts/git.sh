#!/usr/bin/env bash

set -e

###############################################################################
# Git SCM
###############################################################################
# URL: https://git-scm.com/
###############################################################################

NAME="Git"
MARKER="git"

###############################################################################

GITFLOW_URL="https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh"
GITFLOW_TEMP_FILE="$(mktemp -u).sh"

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y --no-install-recommends \
        git \
        tig \
        meld \
    && curl -L ${GITFLOW_URL} -o ${GITFLOW_TEMP_FILE} \
    && sudo ${GITFLOW_TEMP_FILE} install stable \
    && rm ${GITFLOW_TEMP_FILE} \
    && finish_install $MARKER
else
    already_installed $MARKER
fi