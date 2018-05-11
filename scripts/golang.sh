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
[ -z "${GOLANG_VERSION}" ] && GOLANG_VERSION="1.10.2"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz -o golang.tar.gz \
    && sudo tar -C /usr/local -xzf golang.tar.gz \
    && rm golang.tar.gz \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
