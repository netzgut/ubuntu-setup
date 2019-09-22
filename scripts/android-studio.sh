#!/usr/bin/env bash

set -e

###############################################################################
# Android Studio 3.5
###############################################################################
# URL: https://developer.android.com/studio/index.html#downloads
###############################################################################

NAME="Android Studio"
MARKER="android-studio"

###############################################################################

# ANDROID_STUDIO_URL
[ -z "${ANDROID_STUDIO_VERSION}" ] && ANDROID_STUDIO_VERSION="3.5.0.21"
[ -z "${ANDROID_STUDIO_BUILD}" ] && ANDROID_STUDIO_BUILD="191.5791312"
[ -z "${ANDROID_STUDIO_URL}" ] && ANDROID_STUDIO_URL="https://dl.google.com/dl/android/studio/ide-zips/${ANDROID_STUDIO_VERSION}/android-studio-ide-${ANDROID_STUDIO_BUILD}-linux.tar.gz"

###############################################################################

AS_TEMP_FILE="$(mktemp -u).tar.gz"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        libc6:i386 \
        libncurses5:i386 \
        libstdc++6:i386 \
        lib32z1 \
        libbz2-1.0:i386 \
        android-tools-adb \
    && curl -L $ANDROID_STUDIO_URL -o $AS_TEMP_FILE \
    && sudo tar -C /opt -xzf $AS_TEMP_FILE \
    && rm $AS_TEMP_FILE \
    && ln -s /opt/android-studio/bin/studio.sh $BIN_DIRECTORY/studio \
    && echo "$(date)\n${ANDROID_STUDIO_VERSION}-${ANDROID_STUDIO_BUILD}\n" > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME (${ANDROID_STUDIO_VERSION}-${ANDROID_STUDIO_BUILD})"
else
    echo "$NAME is already installed:" \
    && cat $MARKER_DIRECTORY/$MARKER
fi
