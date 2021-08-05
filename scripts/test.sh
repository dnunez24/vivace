#!/usr/bin/env bash

FLAGS=""

if [[ "$CI" == "true" ]]; then
  FLAGS="--bail"
fi

jest "$FLAGS" "$@"
