#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Android Studio 3.5
###############################################################################
# URL: https://developer.android.com/studio/index.html#downloads
###############################################################################

NAME="Android Studio"

###############################################################################

# ANDROID_STUDIO_URL
[ -z "${ANDROID_STUDIO_VERSION}" ] && ANDROID_STUDIO_VERSION="3.5.3.0"
[ -z "${ANDROID_STUDIO_BUILD}" ] && ANDROID_STUDIO_BUILD="191.6010548"
[ -z "${ANDROID_STUDIO_URL}" ] && ANDROID_STUDIO_URL="https://dl.google.com/dl/android/studio/ide-zips/${ANDROID_STUDIO_VERSION}/android-studio-ide-${ANDROID_STUDIO_BUILD}-linux.tar.gz"

###############################################################################

AS_TEMP_FILE="$(mktemp -u).tar.gz"

###############################################################################

print_banner "$NAME" "ANDROID_STUDIO_VERSION=$ANDROID_STUDIO_VERSION" "ANDROID_STUDIO_BUILD=$ANDROID_STUDIO_BUILD"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo apt-get install -y \
        libc6:i386 \
        libncurses5:i386 \
        libstdc++6:i386 \
        lib32z1 \
        libbz2-1.0:i386 \
        android-tools-adb \
    && curl -L $ANDROID_STUDIO_URL -o "$AS_TEMP_FILE" \
    && sudo tar -C /opt -xzf "$AS_TEMP_FILE" \
    && rm "$AS_TEMP_FILE" \
    && ln -s /opt/android-studio/bin/studio.sh "$BIN_DIRECTORY"/studio \
    && finish_install "$MARKER" "ANDROID_STUDIO_VERSION=$ANDROID_STUDIO_VERSION" "ANDROID_STUDIO_BUILD=$ANDROID_STUDIO_BUILD"
else
    already_installed "$MARKER"
fi
