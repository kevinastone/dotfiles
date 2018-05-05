#!/usr/bin/env bash

###############################################################################
# Mouse
###############################################################################

# Set Right-click on Mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton

# Set Right-click on Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad MouseButtonMode -string TwoButton
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1


###############################################################################
# Keyboard
###############################################################################

# Override Modifiers

# None — –1
# Caps Lock — 0
# Shift (Left) — 1
# Control (Left) — 2
# Option (Left) — 3
# Command (Left) — 4
# Keypad 0 — 5
# Help — 6
# Shift (Right) — 9
# Control (Right) — 10
# Option (Right) — 11
# Command (Right) — 12


# Control Strip

# com.apple.system.brightness
# com.apple.system.dashboard
# com.apple.system.dictation
# com.apple.system.do-not-disturb
# com.apple.system.input-menu
# com.apple.system.launchpad
# com.apple.system.media-play-pause
# com.apple.system.mission-control
# com.apple.system.mute
# com.apple.system.notification-center
# com.apple.system.screen-lock
# com.apple.system.screen-saver
# com.apple.system.screencapture
# com.apple.system.search
# com.apple.system.show-desktop
# com.apple.system.siri
# com.apple.system.sleep
# com.apple.system.volume

defaults write com.apple.controlstrip MiniCustomized -array 'com.apple.system.media-play-pause' 'com.apple.system.volume' 'com.apple.system.mute' 'com.apple.system.screen-lock'

killall ControlStrip &> /dev/null
