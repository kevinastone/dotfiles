# Installation Instructions

## Setup your dotfiles

        yes | ./install.sh

## Install System Packages

        # Install Homebrew
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
        ./brewinstall.sh

## Install Libraries
        # Install Pip
        sudo easy_install pip
        # Install pipsi
        sudo pip install pipsi
        # Install Python Libraries
        cat requirements.txt | sed '/^\s*#/d'| xargs -n1 pipsi install
        # Install NPM Libraries
        ./npm.sh
        # Install Ruby Gems
        sudo ./gem.sh
        bundler install
        # Install Sublime Package Manager
        ./sublime.sh

## Configure Fish Shell

        echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
        chsh -s /usr/local/bin/fish

## Setup Syncing for Alfred

1. After installing powerpack license

2. Preferences->Advanced

    Syncing -> Set sync folder
