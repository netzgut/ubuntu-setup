#!/usr/bin/env bash

set -e

NAME="Visual Studio Code"
MARKER="vscode"

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && sudo apt-get update \
    && sudo apt-get install -y code \
    && code --install-extension flowtype.flow-for-vscode \
    && code --install-extension donjayamanne.githistory \
    && code --install-extension msjsdiag.debugger-for-chrome \
    && code --install-extension PeterJausovec.vscode-docker \
    && code --install-extension dbaeumer.vscode-eslint \
    && code --install-extension Zignd.html-css-class-completion \
    && code --install-extension 2gua.rainbow-brackets \
    && code --install-extension robinbentley.sass-indented \
    && code --install-extension robertohuertasm.vscode-icons \
    && code --install-extension Shan.code-settings-sync \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi

