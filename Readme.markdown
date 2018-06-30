# Installation Instructions

## Setup your dotfiles

        yes | ./install.sh

## Install System Packages

        # Install Homebrew
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
        brew bundle
        # Optional dev
        brew bundle --file=dev.Brewfile

## Configure Fish Shell

        echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
        chsh -s /usr/local/bin/fish

        # Configure Fisherman
        fisher

## Editors

        # Install Sublime Package Manager
        ./sublime.sh
        # Vim Plugins
        vim -c "PlugInstall"
        # Configure Atom
        ./atom.sh

## Install Libraries

        # Install NPM Libraries
        ./npm.sh

## Setup Syncing for Alfred

1. After installing powerpack license

2. Preferences->Advanced

    Syncing -> Set sync folder
