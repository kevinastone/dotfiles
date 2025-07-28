#!/usr/bin/env bash

###############################################################################
# Kap
###############################################################################

if [ ! -e "$HOME/Library/Application Support/k9s/" ]; then
    exit
fi

pushd "${BASH_SOURCE%/*}" &>/dev/null
cp ./k9s-plugins.yaml "$HOME/Library/Application Support/k9s/plugins.yaml"
fi
popd &>/dev/null
