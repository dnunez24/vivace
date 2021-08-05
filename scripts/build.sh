#!/usr/bin/env bash

FLAGS="--build"

if [[ "$CI" == "true" ]]; then
  FLAGS="$FLAGS --verbose"
fi

tsc "$FLAGS" "$@" tsconfig.build.json
