# Installation Instructions

## Nix (on MacOS)

### Install Nix

```
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --prefer-upstream-nix
```

### Run Nix-Darwin

```
sudo nix run nix-darwin -- switch --flake ~/dotfiles --accept-flake-config
```

Rebuilds can be run with:

```
sudo darwin-rebuild switch --flake ~/dotfiles
```

### Maintenance & Garbage Collection

Garbage collection runs automatically weekly (`--delete-older-than 30d`) via launchd, and store deduplication is enabled automatically.

To run maintenance manually:

```bash
# Delete older system generations (nix-darwin) and collect unreferenced store paths
sudo nix-collect-garbage --delete-older-than 14d

# Or delete ALL previous generations (keeps only active generation)
sudo nix-collect-garbage -d

# Deduplicate identical store files via hardlinks
nix store optimise
```

> **Note on Direnv:** If you use `nix-direnv`, project devShells are kept alive as GC roots. To reclaim that space, remove `.direnv` caches in your projects before collecting garbage:
> ```bash
> find ~/Documents -maxdepth 3 -type d -name ".direnv" -prune -exec rm -rf {} +
> ```

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


## Alfred

1. After installing powerpack license

2. Preferences->Advanced

        Syncing -> Set sync folder


3. The `alfred` directory has snapshots of key files


## Alternative: Setup your dotfiles

```
yes | ./install.sh
```
