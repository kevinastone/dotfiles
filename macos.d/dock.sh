#!/usr/bin/env bash

###############################################################################
# Dock                                                                        #
###############################################################################

defaults write com.apple.dock show-recents -bool false
# Set the tile size (and hence dock height) to 64
defaults write com.apple.dock tilesize -int 64

killall Dock &> /dev/null
