#!/usr/bin/env bash

set -e

###############################################################################
# Golang Programming Language
###############################################################################
# URL: https://golang.org/
###############################################################################

NAME="Golang"
MARKER="golang"

###############################################################################

# GOLANG_VERSION
[ -z "${GOLANG_VERSION}" ] && GOLANG_VERSION="1.12.7"

###############################################################################

GO_TEMP_FILE="$(mktemp -u).tar.gz"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz -o $GO_TEMP_FILE \
    && sudo tar -C /usr/local -xzf $GODOT_TEMP_FILE \
    && rm $GO_TEMP_FILE \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
