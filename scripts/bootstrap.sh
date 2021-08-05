#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INSTALL_CMD="install"
INSTALL_FLAGS="--workspaces"

if [[ "$CI" == "true" ]]; then
  CMD="ci"
fi

echo
echo "Installing latest version of npm..."
npm install --global npm

echo
echo "Installing npm packages..."
npm "$INSTALL_CMD" "$INSTALL_FLAGS"

echo
echo "Building project..."
${SCRIPT_DIR}/build.sh
