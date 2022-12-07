#!/usr/bin/env bash

###############################################################################
# Finder                                                                      #
###############################################################################

# Show Internal HDDs on Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# New window target
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Path bar
defaults write com.apple.finder ShowPathbar -bool true

# Search scope
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


killall Finder &> /dev/null
