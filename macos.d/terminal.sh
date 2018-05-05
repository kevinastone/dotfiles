#!/usr/bin/env bash

###############################################################################
# Terminal
###############################################################################

defaults write com.apple.Terminal NewTabWorkingDirectoryBehavior -bool true

pushd "${BASH_SOURCE%/*}" &>/dev/null
/usr/libexec/PlistBuddy \
    -c 'Set :"Window Settings":Basic:shellExitAction bool true' \
    -c 'Delete :"Window Settings":Basic:noWarnProcesses' \
    -c 'Add :"Window Settings":Basic:noWarnProcesses array' \
    -c 'Merge nowarn.terminal.plist :"Window Settings":Basic:noWarnProcesses' \
    ~/Library/Preferences/com.apple.Terminal.plist
popd &>/dev/null
