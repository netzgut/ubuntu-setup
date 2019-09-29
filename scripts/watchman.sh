#!/usr/bin/env bash

set -e

###############################################################################
# Facebook Watchman
###############################################################################
# URL: https://facebook.github.io/watchman/
###############################################################################

NAME="Facebook Watchman"
MARKER="watchman"

###############################################################################

# WATCHMAN_VERSION
[ -z "${WATCHMAN_VERSION}" ] && WATCHMAN_VERSION="v4.9.0"

# INOTIFY_MAX_USER_WATCHES
[ -z "${INOTIFY_MAX_USER_WATCHES}" ] && INOTIFY_MAX_USER_WATCHES="999999"
# INOTIFY_MAX_QUEUED_EVENTS
[ -z "${INOTIFY_MAX_QUEUED_EVENTS}" ] && INOTIFY_MAX_QUEUED_EVENTS="999999"
# INOTIFY_MAX_USER_INSTANCES
[ -z "${INOTIFY_MAX_USER_INSTANCES}" ] && INOTIFY_MAX_USER_INSTANCES="999999"

###############################################################################

print_banner "$NAME" "WATCHMAN_VERSION=$WATCHMAN_VERSION" "INOTIFY_MAX_USER_WATCHES=$INOTIFY_MAX_USER_WATCHES" "INOTIFY_MAX_QUEUED_EVENTS=$INOTIFY_MAX_QUEUED_EVENTS" "INOTIFY_MAX_USER_INSTANCES=$INOTIFY_MAX_USER_INSTANCES"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y autoconf automake build-essential python-dev libssl-dev libtool \
    && git clone https://github.com/facebook/watchman.git /tmp/watchman \
    && cd /tmp/watchman \
    && git checkout $WATCHMAN_VERSION \
    && ./autogen.sh \
    && ./configure \
    && make \
    && sudo make install \
    && echo $INOTIFY_MAX_USER_WATCHES | sudo tee -a /proc/sys/fs/inotify/max_user_watches \
    && echo $INOTIFY_MAX_QUEUED_EVENTS | sudo tee -a  /proc/sys/fs/inotify/max_queued_events \
    && echo $INOTIFY_MAX_USER_INSTANCES | sudo tee  -a /proc/sys/fs/inotify/max_user_instances \
    && watchman  shutdown-server \
    && sudo rm -rf /tmp/watchman \
    && finish_install $MARKER "WATCHMAN_VERSION=$WATCHMAN_VERSION" "INOTIFY_MAX_USER_WATCHES=$INOTIFY_MAX_USER_WATCHES" "INOTIFY_MAX_QUEUED_EVENTS=$INOTIFY_MAX_QUEUED_EVENTS" "INOTIFY_MAX_USER_INSTANCES=$INOTIFY_MAX_USER_INSTANCES"
else
    already_installed $MARKER
fi
