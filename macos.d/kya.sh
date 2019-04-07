#!/usr/bin/env bash

###############################################################################
# Keeping You Awake
###############################################################################

if [ ! -e "$HOME/Library/Containers/info.marcel-dierkes.KeepingYouAwake/Data/Library/Preferences/info.marcel-dierkes.KeepingYouAwake.plist" ]; then
    exit
fi

pushd "${BASH_SOURCE%/*}" &>/dev/null

killall KeepingYouAwake &> /dev/null
/usr/libexec/PlistBuddy \
    -c 'Set :"info.marcel-dierkes.KeepingYouAwake.ActivateOnLaunch" 1' \
    "$HOME/Library/Containers/info.marcel-dierkes.KeepingYouAwake/Data/Library/Preferences/info.marcel-dierkes.KeepingYouAwake.plist"

popd &>/dev/null
