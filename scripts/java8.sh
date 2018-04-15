#!/usr/bin/env bash

set -e

###############################################################################
# Oracle Java 8 SDK via ppa:webupd8team/java
###############################################################################
# URL: https://launchpad.net/~webupd8team/+archive/ubuntu/java
###############################################################################

NAME="Java 8 (Oracle)"
MARKER="oracle-java8"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository -y ppa:webupd8team/java \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections \
    && sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        oracle-java8-installer \
        oracle-java8-set-default \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished install $NAME"
else
    echo "$NAME is already installed"
fi
