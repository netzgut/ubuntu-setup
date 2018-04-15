
#!/usr/bin/env bash

set -e

# LOCATION OF THE MARKER FILES
export MARKER_DIRECTROY="$HOME/.idempotent"

# BIN DIRECTORY
export BIN_DIRECTORY="$HOME/bin"

# DO NOT REMOVE THIS IS REQUIRED
( ./scripts/_basic-requirements.sh )


# SETTINGS DEFAULT OVERRIDES FOR SCRIPTS
# export DOCKER_COMPOSE_VERSION="1.20.1"

# ADD THE SCRIPTS YOU WANT TO RUN
# ( ./scripts/chrome.sh )

# CLEANUP
sudo apt-get autoremove \
&& sudo apt-get autoclean

echo "DONE!"