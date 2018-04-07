
#!/usr/bin/env bash

set -e

# LOCATION OF THE MARKER FILES
export MARKER_DIRECTORY="$HOME/.idempotent"

# SETTINGS FOR SCRIPTS
export DOCKER_COMPOSE_VERSION="1.20.1"
export GIT_FLOW_REPO_HOME="$HOME/.gitflow"
export JETBRAINS_TOOLBOX_VERSION="1.8.3678"
export JIRACLIENT_VERSION="3_8_4"
export NVM_VERSION="0.33.8"
export ANDROID_STUDIO_URL=https://dl.google.com/dl/android/studio/ide-zips/3.1.0.16/android-studio-ide-173.4670197-linux.zip
export GOLANG_VERSION="1.10.1"


# DO NOT REMOVE THIS IS REQUIRED
( ./scripts/_basic-requirements.sh )

# ADD THE SCRIPTS YOU WANT TO RUN
# ( ./scripts/chrome.sh )

# CLEANUP
sudo apt-get autoremove
sudo apt-get autoclean

echo "DONE!"