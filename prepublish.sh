#!/usr/bin/env bash
set -e -o pipefail

SHDOC_VERSION=$(jq -r ".shellDependencies.shdoc" package.json)
# echo SHDOC_VERSION: $SHDOC_VERSION
prepublish() {
  if [[ ! -d shdoc ]]; then
    curl -L https://github.com/reconquest/shdoc/archive/refs/tags/v${SHDOC_VERSION}.tar.gz | tar -xzv
    mv "shdoc-${SHDOC_VERSION}/shdoc" shdoc
    rm -rf "shdoc-${SHDOC_VERSION}"
  fi

  # make the os env find the gawk installation
  # https://github.com/reconquest/shdoc/issues/24
  sed "s/\#\!\/usr\/bin\/gawk -f/\#\!\/usr\/bin\/env -S gawk -f/" shdoc > dist/shdoc
  chmod +x dist/shdoc
}
#if sourced abort / exit
(return 0 2>/dev/null) && return

prepublish
