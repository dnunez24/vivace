#!/usr/bin/env bash

FLAGS="--color"

if [[ "$CI" == "true" ]]; then
  FLAGS="$FLAGS --bail"
fi

jest $FLAGS $@
