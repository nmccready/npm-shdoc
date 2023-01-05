#!/usr/bin/env bash
set -e -o pipefail

prepublish() {
  if [[ ! -d shdoc ]]; then
    curl -OL https://github.com/reconquest/shdoc/releases/download/v1.1/shdoc
  fi

  # make the os env find the gawk installation
  # https://github.com/reconquest/shdoc/issues/24
  sed "s/\#\!\/usr\/bin\/gawk -f/\#\!\/usr\/bin\/env -S gawk -f/" shdoc > dist/shdoc
  chmod +x dist/shdoc
}
#if sourced abort / exit
(return 0 2>/dev/null) && return

prepublish
