#!/usr/bin/env bash

###############################################################################
# Terminal
###############################################################################

defaults write com.apple.Terminal NewTabWorkingDirectoryBehavior -bool true

pushd "${BASH_SOURCE%/*}" &>/dev/null
/usr/libexec/PlistBuddy \
    -c 'Delete :"Window Settings":Basic:shellExitAction' \
    -c 'Add :"Window Settings":Basic:shellExitAction bool true' \
    -c 'Delete :"Window Settings":Basic:noWarnProcesses' \
    -c 'Add :"Window Settings":Basic:noWarnProcesses array' \
    -c 'Merge nowarn.terminal.plist :"Window Settings":Basic:noWarnProcesses' \
    -c 'Delete :"Window Settings":Basic:useOptionAsMetaKey' \
    -c 'Add :"Window Settings":Basic:useOptionAsMetaKey bool true' \
    ~/Library/Preferences/com.apple.Terminal.plist
popd &>/dev/null
