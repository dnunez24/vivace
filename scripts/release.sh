#!/usr/bin/env bash

if [[ "$CI" != "true" ]]; then
  echo "$0 can only be run in CI environment"
  exit 1
fi

PUBLISH_FLAGS=("--workspaces")
POSITIONAL=()

while [[ $# -gt 0 ]]; do
  arg="$1"

  case $arg in
    -d|--dry-run)
      PUBLISH_FLAGS+=("--dry-run")
      shift
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

npm publish ${PUBLISH_FLAGS[@]}
