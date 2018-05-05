#!/usr/bin/env bash

###############################################################################
# VLC
###############################################################################

mkdir -p ~/Library/Preferences/org.videolan.vlc
pushd "${BASH_SOURCE%/*}" &>/dev/null
cp vlcrc ~/Library/Preferences/org.videolan.vlc/
popd &>/dev/null
