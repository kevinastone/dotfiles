#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Load our Defined Bash Profile Configurations
if [ -d macos.d ]; then
    for fn in macos.d/*.sh; do
        echo $fn
        bash $fn
    done
fi
