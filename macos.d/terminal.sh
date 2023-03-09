#!/usr/bin/env bash

###############################################################################
# Terminal
###############################################################################

defaults write com.apple.Terminal NewTabWorkingDirectoryBehavior -bool true

pushd "${BASH_SOURCE%/*}" &>/dev/null
/usr/libexec/PlistBuddy \
    -c 'Delete :"Window Settings":Basic:noWarnProcesses' \
    -c 'Add :"Window Settings":Basic:noWarnProcesses array' \
    -c 'Merge nowarn.terminal.plist :"Window Settings":Basic:noWarnProcesses' \
    -c 'Set :"Window Settings":Basic:useOptionAsMetaKey true' \
    -c 'Set :"Window Settings":Basic:shellExitAction 1' \
    ~/Library/Preferences/com.apple.Terminal.plist
popd &>/dev/null
