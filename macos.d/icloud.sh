#!/usr/bin/env bash

###############################################################################
# iCloud                                                                      #
###############################################################################

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
