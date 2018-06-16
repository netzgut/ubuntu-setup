#!/usr/bin/env bash

set -e

###############################################################################
# Visual Studio Code Editor Extensions
###############################################################################
# URL: https://code.visualstudio.com/
###############################################################################

NAME="Visual Studio Code Extensions"
MARKER="vscode-extensions"

###############################################################################

echo "Trying to install $NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    code --install-extension 2gua.rainbow-brackets \
    && code --install-extension PeterJausovec.vscode-docker \
    && code --install-extension Zignd.html-css-class-completion \
    && code --install-extension bschulte.love \
    && code --install-extension dbaeumer.vscode-eslint \
    && code --install-extension donjayamanne.githistory \
    && code --install-extension flowtype.flow-for-vscode \
    && code --install-extension ms-vscode.go \
    && code --install-extension msjsdiag.debugger-for-chrome \
    && code --install-extension robertohuertasm.vscode-icons \
    && code --install-extension robinbentley.sass-indented \
    && code --install-extension patrys.vscode-code-outline \
    && code --install-extension rust-lang.rust \
    && date > $MARKER_DIRECTORY/$MARKER \
    && echo "Finished installing $NAME"
else
    echo "$NAME is already installed"
fi
