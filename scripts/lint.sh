#!/usr/bin/env bash

FLAGS="--cache --ext ts"

if [[ "$CI" != "true" ]]; then
  FLAGS="$FLAGS --fix"
fi

eslint "$FLAGS" "$@" .
