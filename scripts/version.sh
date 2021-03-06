#!/usr/bin/env bash

if [[ "$CI" != "true" ]]; then
  echo "$0 can only be run in CI environment"
  exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(cd $SCRIPT_DIR/..; pwd)"
CHANGELOG_PATH="${PROJECT_ROOT}/CHANGELOG.md"
VERSION_FLAGS=("--no-verify")
PUSH_FLAGS=("--follow-tags" "--verbose")
POSITIONAL=()

while [[ $# -gt 0 ]]; do
  arg="$1"

  case $arg in
    -d|--dry-run)
      VERSION_FLAGS+=("--dry-run")
      PUSH_FLAGS+=("--dry-run")
      shift
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

if [[ ! -f "$CHANGELOG_PATH" ]]; then
  echo "CHANGELOG.md not found. Assuming this is the first release."
  echo
  VERSION_FLAGS+=("--first-release")
fi

if [[ ! -z "$GITHUB_ACTOR" ]]; then
  git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
  git config user.name "$GITHUB_ACTOR"
fi

echo "Bumping package versions..."
echo

standard-version ${VERSION_FLAGS[@]}

echo
echo "Pushing version tags to origin..."
echo

git push ${PUSH_FLAGS[@]} origin ${GITHUB_REF:-"main"}
