#!/usr/bin/env bash

###############################################################################
# Mouse
###############################################################################

# Set Right-click on Mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton

# Set Right-click on Trackpad
# defaults write com.apple.AppleMultitouchTrackpad MouseButtonMode -string TwoButton
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1

# Swipe Between Full-Screen Applications
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
