#!/bin/sh
mkdir -p $HOME/Library/"Application Support"/"Sublime Text 3"/"Installed Packages"
cd $HOME/Library/"Application Support"/"Sublime Text 3"/"Installed Packages"
[ -e "Package Control.sublime-package" ] || {
    wget https://packagecontrol.io/Package%20Control.sublime-package
}

if [ -e $HOME/Dropbox/AppData/Sublime/User ]; then

    [ "$(readlink $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User)" = "$HOME/Dropbox/AppData/Sublime/User" ] || {
        mv $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/orig.User
        ln -sf $HOME/Dropbox/AppData/Sublime/User $HOME/Library/"Application Support"/"Sublime Text 3"/"Packages"/User
    }
else
    echo "No Dropbox User Folder"
fi
