#!/bin/bash

[ -d ~/.local/pipx/venvs ] || exit
cd ~/.local/pipx/venvs || exit

PY_VERSION="$1"
shift

PYTHON_BIN=$(realpath /usr/local/bin/python3)

exes=()
while IFS= read -r line; do exes+=("$line"); done < <(find . -path "./*/bin/${PY_VERSION}" -print)

for fn in "${exes[@]}"
do
    [ -e "$fn" ] && continue
    echo "Fixing ${fn}"
    ln -sf "$PYTHON_BIN" "${fn}"
done
