#!/usr/bin/env bash

set -e

NAME="Android Studio"
MARKER="android-studio"

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
    && ln -s /opt/android-studio/bin/studio.sh $HOME/bin/studio \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

