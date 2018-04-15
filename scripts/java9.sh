#!/usr/bin/env bash

set -e

NAME="Java 9 (Oracle)"
MARKER="oracle-java9"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository -y ppa:webupd8team/java \
    && echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections \
    && sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        oracle-java9-installer \
        oracle-java9-set-default \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished install $NAME"
else
    echo "$NAME is already installed"
fi
