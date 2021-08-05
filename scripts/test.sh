#!/usr/bin/env bash

FLAGS=""

if [[ "$CI" == "true" ]]; then
  FLAGS="$FLAGS --bail"
fi

jest "$FLAGS" "$@"
