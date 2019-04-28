#!/usr/bin/env bash

set -e

###############################################################################
# Clojure (+ Leiningen)
###############################################################################
# URL: https://clojure.org
###############################################################################

NAME="Clojure (+ Leiningen)"
MARKER="clojure"

###############################################################################

# CLOJURE_VERSION
[ -z "${CLOJURE_VERSION}" ] && CLOJURE_VERSION="1.10.0.442"

###############################################################################

CLOJURE_URL=https://download.clojure.org/install/linux-install-${CLOJURE_VERSION}.sh
LEININUNG_URL=https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

TMP_FILE=/tmp/clojure_${CLOJURE_VERSION}.sh

echo "Trying to install $NAME"
if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L ${CLOJURE_URL} -o $TMP_FILE \
    && sudo bash $TMP_FILE \
    && rm $TMP_FILE \
    && curl -L ${LEININUNG_URL} -o $BIN_DIRECTORY/lein \
    && chmod a+x $BIN_DIRECTORY/lein \
    && $BIN_DIRECTORY/lein
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
