#!/usr/bin/env bash
set -e -o pipefail

preinstall() {
  # binary dependencies
  # if you want to support more than macos, please make PRS
  # to check different OSes
  if [[ ! $(which gawk) ]]; then
    brew install gawk
  fi
}

#if sourced abort / exit
(return 0 2>/dev/null) && return

preinstall
