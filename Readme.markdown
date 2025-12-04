# Installation Instructions


## Setup your dotfiles

```
yes | ./install.sh
```


## Install System Packages

```
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle
```


## Configure Fish Shell

```
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```


## Editors

```
# Install Sublime Package Manager
./sublime.sh
# Vim Plugins
vim -c "PlugInstall"
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


## Nix (on MacOS)

### Install Nix

```
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --prefer-upstream-nix
```

### Install Nix-Darwin

```
sudo nix run nix-darwin -- switch --flake ~/dotfiles
```

### Fixing Nix-Store issues

```
sudo nix-store --verify --check-contents --repair
```


### Development

Reformat

```
nix fmt
```

Checks 

```
nix flake check
```
