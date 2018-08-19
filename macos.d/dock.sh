#!/usr/bin/env bash

###############################################################################
# Dock                                                                        #
###############################################################################

defaults write com.apple.dock show-recents -bool false

killall Dock &> /dev/null
