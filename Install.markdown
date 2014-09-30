# Installation Instructions

## Setup your dotfiles

        yes | ./install.sh

## Install System Packages

        brew bundle

## Install Libraries
        # Install pipsi
        sudo pip install pipsi
        # Install Python Libraries
        cat requirements.txt | xargs -n1 pipsi install
        # Install NPM Libraries
        ./npm.sh
        # Install Ruby Gems
        sudo ./gem.sh
        bundler install
        # Install Sublime Package Manager
        ./sublime.sh
