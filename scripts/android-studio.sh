#!/usr/bin/env bash

set -e

###############################################################################
# Android Studio 3.1
###############################################################################
# URL: https://developer.android.com/studio/index.html#downloads
###############################################################################

NAME="Android Studio"
MARKER="android-studio"

###############################################################################

# ANDROID_STUDIO_URL
[ -z "${ANDROID_STUDIO_URL}" ] && ANDROID_STUDIO_URL="https://dl.google.com/dl/android/studio/ide-zips/3.1.1.0/android-studio-ide-173.4697961-linux.zip" && echo $ANDROID_STUDIO_URL

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        libc6:i386 \
        libncurses5:i386 \
        libstdc++6:i386 \
        lib32z1 \
        libbz2-1.0:i386 \
        android-tools-adb \
    && curl -L $ANDROID_STUDIO_URL -o /tmp/as.zip \
    && sudo unzip /tmp/as.zip -d /opt \
    && ln -s /opt/android-studio/bin/studio.sh $BIN_DIR/studio \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
