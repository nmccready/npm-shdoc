#!/usr/bin/env bash
# for older versions of env that do not have -S (can't use shebang)
gawk -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/shdoc
