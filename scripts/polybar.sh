#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Polybar
###############################################################################
# URL: https://github.com/jaagr/polybar
###############################################################################

NAME="Polybar"

###############################################################################

[ -z "$POLYBAR_VERSION" ] && POLYBAR_VERSION="3.5.7"

###############################################################################

print_banner "$NAME" "POLYBAR_VERSION=$POLYBAR_VERSION"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo apt-get install -y --no-install-recommends \
        gcc \
        build-essentials \
        cmake \
        cmake-data \
        libcairo2-dev \
        libxcb1-dev \
        libxcb-ewmh-dev \
        libxcb-icccm4-dev \
        libxcb-image0-dev \
        libxcb-randr0-dev \
        libxcb-util0-dev \
        libxcb-xkb-dev \
        libxcb-composite0-dev \
        pkg-config \
        python-xcbgen \
        xcb-proto \
        libxcb-xrm-dev \
        i3-wm \
        libasound2-dev \
        libmpdclient-dev \
        libiw-dev \
        libcurl4-openssl-dev \
        libpulse-dev \
    && git clone https://github.com/jaagr/polybar.git /tmp/polybar \
    && cd /tmp/polybar \
    && git checkout "$POLYBAR_VERSION" \
    && ./build.sh \
    && finish_install "$MARKER" "POLYBAR_VERSION=$POLYBAR_VERSION"
else
    already_installed "$MARKER"
fi
