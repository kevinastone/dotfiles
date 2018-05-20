#!/usr/bin/env bash

###############################################################################
# Mail.app                                                                    #
###############################################################################

# View conversations:
# Show most recent messages at the top
defaults write com.apple.mail ConversationViewSortDescending -bool true


killall Mail &> /dev/null
