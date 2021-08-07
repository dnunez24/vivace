#!/usr/bin/env bash

if [[ "$CI" != "true" ]]; then
  echo "$0 can only be run in CI environment"
  exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(cd $SCRIPT_DIR/..; pwd)"
CHANGELOG_PATH="${PROJECT_ROOT}/CHANGELOG.md"
VERSION_FLAGS=()
PUSH_FLAGS=("--follow-tags")
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

git config --global user.email "actions@users.noreply.github.com"
git config --global user.name "GitHub Actions"

echo "Bumping package versions..."
echo

standard-version ${VERSION_FLAGS[@]}

echo
echo "Pushing version tags to origin..."
echo

git push ${PUSH_FLAGS[@]} origin ${GITHUB_REF:-"main"}
