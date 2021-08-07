#!/usr/bin/env bash

FLAGS=("--color")

if [[ "$CI" == "true" ]]; then
  FLAGS+=("--bail")
fi

# Pass script args through to jest
FLAGS+=("$@")

jest ${FLAGS[@]}
