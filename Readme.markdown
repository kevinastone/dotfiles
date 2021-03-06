# Installation Instructions


## Setup your dotfiles

```
yes | ./install.sh
```


## Install System Packages

```
# Install Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
brew bundle
```


## Configure Fish Shell

```
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```


## Editors

```
# Install Sublime Package Manager
./sublime.sh
# Vim Plugins
vim -c "PlugInstall"
# Configure Atom
./atom.sh
```


## Setup Syncing for Alfred

1. After installing powerpack license

2. Preferences->Advanced

        Syncing -> Set sync folder


## Development (optional)

### Install dev homebrew packages

```
brew bundle --file=dev.Brewfile
```

### Install `pipx` for Python virtualization

```
sudo pip3 install pipx
```
