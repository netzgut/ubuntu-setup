#!/usr/bin/env bash

set -e

###############################################################################
# Ubuntu Mainline Kernel
###############################################################################
# URL: http://kernel.ubuntu.com/~kernel-ppa/mainline/
###############################################################################

NAME="Kernel (4.14.13)"
MARKER="kernel-4.14.13"

###############################################################################

BASE_URL="http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.13/"
HEADERS_ALL="linux-headers-4.14.13-041413_4.14.13-041413.201801101001_all.deb"
HEADERS_AMD64="linux-headers-4.14.13-041413-generic_4.14.13-041413.201801101001_amd64.deb"
IMAGE_AMD64="linux-image-4.14.13-041413-generic_4.14.13-041413.201801101001_amd64.deb"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    mkdir -p /tmp/kernel-update \
    && curl -L "$BASE_URL$HEADERS_ALL" -o /tmp/kernel-update/$HEADERS_ALL \
    && curl -L "$BASE_URL$HEADERS_AMD64" -o /tmp/kernel-update/$HEADERS_AMD64 \
    && curl -L "$BASE_URL$IMAGE_AMD64" -o /tmp/kernel-update/$IMAGE_AMD64 \
    && sudo dpkg -i /tmp/kernel-update/*.deb \
    && rm -rf /tmp/kernel-update \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi