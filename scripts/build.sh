#!/usr/bin/env bash

FLAGS=("--pretty")

if [[ "$CI" == "true" ]]; then
  FLAGS+=("--verbose")
fi

while [[ $# -gt 0 ]]; do
  arg="$1"

  case $arg in
    -w|--watch)
      FLAGS+=("--watch")
      shift
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

tsc --build tsconfig.build.json ${FLAGS[@]}
