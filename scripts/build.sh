#!/usr/bin/env bash

FLAGS=""

if [[ "$CI" == "true" ]]; then
  FLAGS="--verbose"
fi

tsc --build tsconfig.build.json "$FLAGS"
