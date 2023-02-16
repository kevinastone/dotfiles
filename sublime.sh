#!/bin/sh
if [ -e $HOME/Library/CloudStorage/Dropbox/AppData/Sublime/User ]; then

    if [ -e $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User ]; then
        [ "$(readlink $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User)" = "$HOME/Library/CloudStorage/Dropbox/AppData/Sublime/User" ] || {
            mv $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/orig.User
            ln -sf $HOME/Library/CloudStorage/Dropbox/AppData/Sublime/User $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User
        }
    else
        mkdir -p $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"
        [ "$(readlink $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User)" = "$HOME/Library/CloudStorage/Dropbox/AppData/Sublime/User" ] || {
            ln -sf $HOME/Library/CloudStorage/Dropbox/AppData/Sublime/User $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User
        }
    fi
else
    echo "No Dropbox User Folder"
fi
