#!/usr/bin/env bash

###############################################################################
# Kap
###############################################################################

if [ ! -e "$HOME/Library/Application Support/Kap/" ]; then
    exit
fi

pushd "${BASH_SOURCE%/*}" &>/dev/null
if [ -e "$HOME/Library/Application Support/Kap/Settings" ]; then
    hash jq 2>/dev/null && jq -s add "$HOME/Library/Application Support/Kap/Settings" ./kap-settings.json > "$HOME/Library/Application Support/Kap/Settings"
else
    cp ./kap-settings.json "$HOME/Library/Application Support/Kap/Settings"
fi
popd &>/dev/null
