#!/usr/bin/env bash

if [[ "$CI" != "true" ]]; then
  echo "Release can only be run in CI environment"
  exit 1
fi

RELEASE_FLAGS=""

if [[ ! -z "$@" ]]; then
  RELEASE_FLAGS="-- $@"
fi

npm run release --workspaces $RELEASE_FLAGS

git push --follow-tags origin $GITHUB_HEAD_REF

npm publish --workspaces --dry-run
