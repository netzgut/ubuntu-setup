#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Almworks JiraClient
###############################################################################
# URL: http://almworks.com/jiraclient/overview.html
###############################################################################

NAME="JIRAClient"

###############################################################################

# JIRACLIENT_VERSION
[ -z "${JIRACLIENT_VERSION}" ] && JIRACLIENT_VERSION="3_8_4"

###############################################################################

JIRACLIENT_TEMP_FILE="$(mktemp -u).tar.gz"

###############################################################################

print_banner "$NAME" "JIRACLIENT_VERSION=$JIRACLIENT_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L http://d1.almworks.com/.files/jiraclient-${JIRACLIENT_VERSION}_without_jre.tar.gz -o $JIRACLIENT_TEMP_FILE \
    && sudo tar xfz $JIRACLIENT_TEMP_FILE -C /opt/ \
    && rm $JIRACLIENT_TEMP_FILE \
    && mkdir -p $HOME/bin \
    && ln -s /opt/jiraclient-${JIRACLIENT_VERSION}/bin/jiraclient.sh $HOME/bin/jiraclient \
    && finish_install $MARKER "JIRACLIENT_VERSION=${JIRACLIENT_VERSION}"
else
    already_installed $MARKER
fi
