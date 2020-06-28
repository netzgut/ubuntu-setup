#!/usr/bin/env bash

set -e

###############################################################################
# Basic Requirements for other scripts
###############################################################################

echo "Installing some basics"
sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y \
&& sudo apt-get install -y --no-install-recommends \
    software-properties-common \
    wget \
    curl \
    git

echo "Setting up needed directories"

mkdir -p "$MARKER_DIRECTORY"
mkdir -p "$BIN_DIRECTORY"

echo "Finished installing basics"