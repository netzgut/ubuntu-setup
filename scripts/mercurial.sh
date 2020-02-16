#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Mercurial SCM
###############################################################################
# URL: https://www.mercurial-scm.org/
###############################################################################

NAME="Mercurial"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo apt-get install -y \
        mercurial \
        python-keyring \
        python-pip \
    && mkdir -p ~/.hgext \
    && curl -L https://bitbucket.org/yujiewu/hgflow/downloads/hgflow-v0.9.8.3.tar.bz2 -o - | tar -xj -C ~/.hgext/ \
    && curl -L -o ~/.hgext/mercurial_keyring.py http://bitbucket.org/Mekk/mercurial_keyring/raw/default/mercurial_keyring.py \
    && pip install mercurial_extension_utils \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
