#!/usr/bin/env bash
set -e -o pipefail

postinstall() {
  # binary dependencies
  # if you want to support more than macos, please make PRS
  # to check different OSes
  if [[ ! $(which gawk) ]]; then
    if [[ $(uname) == 'Darwin' ]]; then
      brew install gawk
    else
      echo "warning: gawk >= 4.X+ needs to be installed to a PATH"
      exit 0
    fi
  fi
}

#if sourced abort / exit
(return 0 2>/dev/null) && return

postinstall
