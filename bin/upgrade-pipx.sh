#!/bin/sh

cd ~/.local/venvs || exit

PY_VERSION="$1"
shift

PYTHON_BIN=$(realpath /usr/local/bin/python3)

find . -path ./\*/bin/${PY_VERSION} -print0 | xargs -0 bash -c 'for fn in $@; do [ -e "$fn" ] || echo $fn; done' -print0 | xargs -0 echo "Fixing "

find . -path ./\*/bin/${PY_VERSION} -print0 | xargs -0 bash -c 'for fn in $@; do [ -e "$fn" ] || echo $fn; done' -print0 | xargs -0 -I {} ln -sf "$PYTHON_BIN" {}
