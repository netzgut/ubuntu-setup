#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Node Version Manager
###############################################################################
# URL: https://github.com/creationix/nvm
###############################################################################

NAME="Node Version Manager (nvm)"

###############################################################################

# NVM_VERSION
[ -z "$NVM_VERSION" ] && NVM_VERSION="0.39.0"

###############################################################################

print_banner "$NAME" "NVM_VERSION=$NVM_VERSION"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash \
    && finish_install "$MARKER" "NVM_VERSION=$NVM_VERSION"
else
    already_installed "$MARKER"
fi
