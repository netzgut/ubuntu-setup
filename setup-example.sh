#!/usr/bin/env bash

set -e

. ./scripts/__helper-functions.sh

# LOCATION OF THE MARKER FILES
export MARKER_DIRECTORY="$HOME/.idempotent"

# BIN DIRECTORY
export BIN_DIRECTORY="$HOME/bin"




# SETTINGS DEFAULT OVERRIDES FOR SCRIPTS
# export DOCKER_COMPOSE_VERSION="1.20.1"


# ADD THE SCRIPTS YOU WANT TO RUN
SCRIPTS=(
    bat
    openjdk11
    clojure
    improve-privacy
    nvm
    rustup
    vim
    vscode
    yarn
)

# NO CHANGES BELOW THIS LINE

check_status "${SCRIPTS[@]}"

SCRIPTS=( "_basic-requirements" "${SCRIPTS[@]}" )

run_scripts "${SCRIPTS[@]}"

cleanup

printf "\n\nDONE!\n"
