#!/usr/bin/env bash

set -e

###############################################################################
# Oracle Java 10 SDK via ppa:linuxuprising/java
###############################################################################
# URL: https://www.linuxuprising.com/2018/04/install-oracle-java-10-in-ubuntu-or.html
###############################################################################

NAME="Java 10 (Oracle)"
MARKER="oracle-java10"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository -y ppa:linuxuprising/java \
    && echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections \
    && sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        oracle-java10-installer \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished install $NAME"
else
    echo "$NAME is already installed"
fi
