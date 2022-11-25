#!/usr/bin/env bash

###############################################################################
# VLC
###############################################################################

mkdir -p ~/Library/Preferences/org.videolan.vlc
pushd "${BASH_SOURCE%/*}" &>/dev/null
cp vlcrc ~/Library/Preferences/org.videolan.vlc/
popd &>/dev/null

if `hash duti >/dev/null 2>&1`
then
    duti -s org.videolan.vlc .avi all
    duti -s org.videolan.vlc .mp4 all
    duti -s org.videolan.vlc .mpg all
fi
