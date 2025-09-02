#!/usr/bin/env bash

###############################################################################
# Kap
###############################################################################

if [ ! -e "$HOME/Library/Application Support/k9s/" ]; then
    exit
fi

pushd "${BASH_SOURCE%/*}" &>/dev/null
    ln -sf "$PWD/k9s/plugins" "$HOME/Library/Application Support/k9s/plugins"
popd &>/dev/null
