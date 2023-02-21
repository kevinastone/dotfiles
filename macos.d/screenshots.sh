#!/usr/bin/env bash

###############################################################################
# Screenshots                                                                 #
###############################################################################

defaults write com.apple.screencapture "location" -string "$HOME/Downloads"

killall SystemUIServerk &> /dev/null
