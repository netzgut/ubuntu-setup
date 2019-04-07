#!/usr/bin/env bash

set -e

###############################################################################
# Docker CE
###############################################################################
# URL: https://docs.docker.com/install/linux/docker-ce/ubuntu/
###############################################################################

NAME="Docker"
MARKER="docker"

###############################################################################

# DOCKER_COMPOSE_VERSION
[ -z "${DOCKER_COMPOSE_VERSION}" ] && DOCKER_COMPOSE_VERSION="1.24.0"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get remove -y docker docker-engine docker.io \
    && sudo apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && sudo apt-get update \
    && sudo apt-get install -y docker-ce \
    && sudo usermod -aG docker $(id -u -n) \
    \
    && sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

