#!/usr/bin/env bash

# WSL
if [[ "$(uname -r)" == *"-Microsoft" ]]; then
  export DISPLAY=:0
fi
