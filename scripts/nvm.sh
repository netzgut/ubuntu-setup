#!/usr/bin/env bash

set -e

###############################################################################
# Node Version Manager
###############################################################################
# URL: https://github.com/creationix/nvm
###############################################################################

NAME="Node Version Manager (nvm)"
MARKER=nvm

###############################################################################

# NVM_VERSION
[ -z "${NVM_VERSION}" ] && NVM_VERSION="0.34.0"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
