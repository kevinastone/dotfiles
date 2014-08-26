#!/bin/sh
mkdir -p ~/Library/"Application Support"/"Sublime Text 3"/"Installed Packages"
cd ~/Library/"Application Support"/"Sublime Text 3"/"Installed Packages"
[ -e "Package Control.sublime-package" ] || wget https://sublime.wbond.net/Package%20Control.sublime-package
