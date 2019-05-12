#!/usr/bin/env bash

set -e

###############################################################################
# Almworks JiraClient
###############################################################################
# URL: http://almworks.com/jiraclient/overview.html
###############################################################################

NAME="JIRAClient"
MARKER="jiraclient"

###############################################################################

# JIRACLIENT_VERSION
[ -z "${JIRACLIENT_VERSION}" ] && JIRACLIENT_VERSION="3_8_4"

###############################################################################

JIRACLIENT_TEMP_FILE="$(mktemp -u).tar.gz"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L http://d1.almworks.com/.files/jiraclient-${JIRACLIENT_VERSION}_without_jre.tar.gz -o $JIRACLIENT_TEMP_FILE \
    && sudo tar xfz $JIRACLIENT_TEMP_FILE -C /opt/ \
    && rm $JIRACLIENT_TEMP_FILE \
    && mkdir -p $HOME/bin \
    && ln -s /opt/jiraclient-${JIRACLIENT_VERSION}/bin/jiraclient.sh $HOME/bin/jiraclient \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
