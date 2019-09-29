#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Clojure (+ Leiningen)
###############################################################################
# URL: https://clojure.org
###############################################################################

NAME="Clojure (+ Leiningen)"

###############################################################################

# CLOJURE_VERSION
[ -z "${CLOJURE_VERSION}" ] && CLOJURE_VERSION="1.10.1.469"

###############################################################################

CLOJURE_URL=https://download.clojure.org/install/linux-install-${CLOJURE_VERSION}.sh
LEININUNG_URL=https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
CLOJURE_TEMP_FILE="$(mktemp -u).sh"

###############################################################################

print_banner "$NAME" "CLOJURE_VERSION=$CLOJURE_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L ${CLOJURE_URL} -o $CLOJURE_TEMP_FILE \
    && sudo bash $CLOJURE_TEMP_FILE \
    && rm $CLOJURE_TEMP_FILE \
    && curl -L ${LEININUNG_URL} -o $BIN_DIRECTORY/lein \
    && chmod a+x $BIN_DIRECTORY/lein \
    && $BIN_DIRECTORY/lein \
    && finish_install $MARKER "CLOJURE_VERSION=$CLOJURE_VERSION"
else
    already_installed $MARKER
fi
