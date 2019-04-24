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

# BAT_VERSION
[ -z "${CLOJURE_VERSION}" ] && CLOJURE_VERSION=1.10.0.442

###############################################################################

CLOJURE_URL=https://download.clojure.org/install/linux-install-${CLOJURE_VERSION}.sh
LEININUNG_URL=https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

echo "Trying to install $NAME"
curl -O https://download.clojure.org/install/linux-install-1.10.0.442.sh
chmod +x linux-install-1.10.0.442.sh
sudo ./linux-install-1.10.0.442.sh
if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L ${CLOJURE_URL} -o /tmp/clojure_${CLOJURE_VERSION}.sh \
    && chmod +x /tmp/clojure_${CLOJURE_VERSION}.sh \
    && sudo ./tmp/clojure_${CLOJURE_VERSION}.sh \
    && rm /tmp/clojure_${CLOJURE_VERSION}_amd64.deb \
    && curl -L ${LEININUNG_URL} -o $BIN_DIRECTORY/lein \
    && chmod a+x $BIN_DIRECTORY/lein \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
