#!/usr/bin/env bash

###############################################################################
# Photos
###############################################################################

# Startup (with iCloud Photos selected)
defaults write com.apple.Photos IPXDefaultDidPromoteiCloudPhotosInGettingStarted -bool true
defaults write com.apple.Photos IPXDefaultHasBeenLaunched -bool true
defaults write com.apple.Photos IPXDefaultHasChosenToEnableiCloudPhotosInGettingStarted -bool true


killall Photos &> /dev/null
