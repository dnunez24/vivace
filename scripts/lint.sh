#!/usr/bin/env bash

FLAGS=("--cache" "--ext" "ts")

if [[ "$CI" != "true" ]]; then
  FLAGS+=("--fix")
fi

# Pass all script args through to eslint
FLAGS+=("$@")

eslint ${FLAGS[@]} .

