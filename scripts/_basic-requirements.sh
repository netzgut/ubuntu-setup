#!/usr/bin/env bash

set -e

echo "Installing basics"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo apt-get install -y --no-install-recommends software-properties-common wget curl

mkdir -p ~/.idempotent

echo "Finished installing basics"