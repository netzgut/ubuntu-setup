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
[ -n "${JIRACLIENT_VERSION}" ] && JIRACLIENT_VERSION="3_8_4"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L http://d1.almworks.com/.files/jiraclient-${JIRACLIENT_VERSION}_without_jre.tar.gz -o /tmp/jiraclient.tar.gz \
    && sudo tar xvfz /tmp/jiraclient.tar.gz -C /opt/ \
    && mkdir -p $HOME/bin \
    && ln -s /opt/jiraclient-${JIRACLIENT_VERSION}/bin/jiraclient.sh $HOME/bin/jiraclient \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
