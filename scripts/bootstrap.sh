#!/usr/bin/env bash

INSTALL_CMD="install"

if [[ "$CI" == "true" ]]; then
  INSTALL_CMD="ci"
fi

echo
echo "Installing latest version of npm..."
npm install --global npm

echo
echo "Installing npm packages..."
npm "$INSTALL_CMD"
