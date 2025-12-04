# Installation Instructions

## Nix (on MacOS)

### Install Nix

```
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --prefer-upstream-nix
```

### Run Nix-Darwin

```
sudo nix run nix-darwin -- switch --flake ~/dotfiles
```

Rebuilds can be run with:

```
sudo darwin-rebuild switch --flake ~/dotfiles
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


## Alternative: Setup your dotfiles

```
yes | ./install.sh
```
