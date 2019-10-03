#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Golang Programming Language
###############################################################################
# URL: https://golang.org/
###############################################################################

NAME="Golang"

###############################################################################

# GOLANG_VERSION
[ -z "${GOLANG_VERSION}" ] && GOLANG_VERSION="1.13.1"

###############################################################################

GO_TEMP_FILE="$(mktemp -u).tar.gz"

###############################################################################

print_banner "$NAME" "GOLANG_VERSION=$GOLANG_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz -o $GO_TEMP_FILE \
    && sudo tar -C /usr/local -xzf $GO_TEMP_FILE \
    && rm $GO_TEMP_FILE \
    && finish_install $MARKER "GOLANG_VERSION=$GOLANG_VERSION"
else
    already_installed $MARKER
fi
