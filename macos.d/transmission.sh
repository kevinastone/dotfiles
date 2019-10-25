#!/usr/bin/env bash

###############################################################################
# Transmission
###############################################################################

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# Import Torrents
defaults write org.m0k.transmission AutoImport -bool true
defaults write org.m0k.transmission AutoImportDirectory -string ~/Downloads

# Partial Files
defaults write org.m0k.transmission RenamePartialFiles -bool false

# General
defaults write org.m0k.transmission AutoSize -bool true