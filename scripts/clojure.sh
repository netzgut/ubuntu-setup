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
[ -z "${CLOJURE_VERSION}" ] && CLOJURE_VERSION="1.10.1.446"

###############################################################################

CLOJURE_URL=https://download.clojure.org/install/linux-install-${CLOJURE_VERSION}.sh
LEININUNG_URL=https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
CLOJURE_TEMP_FILE="$(mktemp -u).sh"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L ${CLOJURE_URL} -o $CLOJURE_TEMP_FILE \
    && sudo bash $CLOJURE_TEMP_FILE \
    && rm $CLOJURE_TEMP_FILE \
    && curl -L ${LEININUNG_URL} -o $BIN_DIRECTORY/lein \
    && chmod a+x $BIN_DIRECTORY/lein \
    && $BIN_DIRECTORY/lein \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
