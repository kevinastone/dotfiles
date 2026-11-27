# Dotfiles Review & Cleanup TODO

> Note: Suggestions preserve the shared non-Nix configs (`config/git`, `config/ghostty`, `config/starship.toml`, `hammerspoon`, `alfred`, `tmux.conf`, `install.sh`, `macos.sh`, `Brewfile`) used on machines where Nix cannot be installed.

## Bugs & Broken Behavior

- [x] **Fix wrong plist domain in Mail defaults** (`nix/darwin/system/mail.nix`):
  `ConversationViewSortDescending = true` is being written to `"com.apple.Photos"` instead of `"com.apple.mail"` (copy-paste from `photos.nix`). Also consider `CustomUserPreferences` instead of `CustomSystemPreferences` for per-user app preferences.
- [x] **Update `k9s` Catppuccin skin path for XDG** (`nix/home/admin/k8s/k9s/default.nix`):
  `preferencesPath` hardcodes `"Library/Application Support/"` on Darwin (also producing a double slash `Support//k9s`). Now that `xdg.enable = true` is enabled, `programs.k9s` and `catppuccin/nix` use `~/.config/k9s`, so the `lib.mkForce` skin override is written to the wrong directory and no longer takes effect. Switch to `xdg.configFile."k9s/skins/catppuccin-mocha.yaml"` when `!pkgs.stdenv.hostPlatform.isDarwin || config.xdg.enable`.
- [x] **Fix `workon` fallback logic in Fish** (`nix/home/shell/workon.nix`):
  Line 15 runs `set -q WORKON_BASE_DIR; or set`—in Fish, bare `set` prints every shell variable to stdout and returns `0`, so when `WORKON_BASE_DIR` is unset (e.g., on Linux), `workon` dumps the entire environment and sets `base` to empty instead of `$HOME` (`cd /$path`). Replace with an explicit `if set -q WORKON_BASE_DIR ... else ... end`.
- [x] **Fix `tmux.conf` reload keybinding for XDG** (`tmux.conf`):
  `bind r source-file ~/.tmux.conf` fails on Nix machines now that `programs.tmux` writes `~/.config/tmux/tmux.conf`. Use an `if-shell` check so `<prefix> r` works on both Nix (`~/.config/tmux/tmux.conf`) and non-Nix (`~/.tmux.conf`) machines:
  ```tmux
  bind r if-shell "[ -f ~/.config/tmux/tmux.conf ]" "source-file ~/.config/tmux/tmux.conf" "source-file ~/.tmux.conf" \; display-message "  Config reloaded..."
  ```
  *(Also remove the duplicate `set -g history-limit 10000` on line 12.)*
- [x] **Use absolute paths in Time Machine exclusions** (`nix/darwin/system/time-machine.nix`):
  `SkipPaths` uses `"~${username}/Downloads"` etc., which macOS `backupd` does not expand inside `/Library/Preferences/com.apple.TimeMachine.plist`. Use `"/Users/${username}/..."` instead.
- [x] **Fix `SystemUIServer` typo in non-Nix macOS script** (`macos.d/screenshots.sh`):
  `killall SystemUIServerk` has a trailing `k`, silently failing to restart `SystemUIServer` when running `./macos.sh`.
- [x] **Update `.skip-install` for root repo files** (`.skip-install`):
  `install.sh` symlinks every non-dot file in the repo root to `~/.<file>` unless matched in `.skip-install`. Add `TODO\.md` (and remove obsolete `sublime.sh`).

## Dead, Orphaned & Duplicate Config

- [ ] **Remove duplicate packages across modules**:
  - `duckdb` is listed in both `nix/home/dev/default.nix` and `nix/home/utils/default.nix`.
  - `nil` and `nixd` are listed in both `nix/home/dev/nix.nix` and `nix/home/zed/languages/nix.nix` (`extraPackages`). Also consider running only `nixd` (or `nil`) in Zed's `languages.Nix.language_servers` rather than both simultaneously to avoid duplicate LSP diagnostics/hover output.
  - `htop` is installed in both `nix/default.nix` (`environment.systemPackages`) and `nix/home/utils/htop.nix` (`programs.htop.enable = true`).
  - `vim` and `environment.variables.EDITOR = "vim"` in `nix/default.nix` overlap with `programs.neovim` (`defaultEditor = true`, `vimAlias = true`) in `nix/home/vim/default.nix`.
- [ ] **Clean up unused / unimported modules and files**:
  - `nix/home/vim/vimrc`: ~200-line legacy `vim-plug` config not referenced by Nix or `install.sh` (`.skip-install` skips `nix/.*`).
  - `nix/home/shell/bash/`: `default.nix` is empty (`{ }`) and `profile.d/{cdr,workon}.bash` are unreferenced.
  - `nix/overlays/default.nix`: empty `imports = [ ];` stub.
  - `nix/home/dev/vscode/`: never imported, `programs.vscode.enable` is unset, and `keybindings.nix` returns `{ keybindings = [ ... ]; }` instead of a list (which would fail module type-checking if enabled). Either wire it up or remove it.
  - `nix/home/utils/sqlite/`: never imported in `nix/home/utils/default.nix` (and writes `~/.sqliterc` rather than XDG).
- [ ] **Simplify `unnest-video-file` wrapper** (`nix/home/media/scripts/`):
  `unnest-video-file.mts` (+ `zx`, `package.json`, `package-lock.json`, `.gitignore`) only parses `-i`/`--ignore` and `-n`/`--dry-run` before spawning `unnest-video-file-nu`. Handling those flags directly in `unnest-video-file.nu` (or a tiny `getopts` shell wrapper) removes the `zx`/Node runtime dependency and lockfiles.

## Security, Platform Guards & Idioms

- [ ] **Remove relative `./node_modules/.bin` from global `PATH`** (`nix/home/shell/fish/conf.d/node.fish`):
  `fish_add_path -g ./node_modules/.bin` puts a relative directory in global `PATH`, allowing any directory you `cd` into to shadow binaries like `git` or `ls`. Prefer per-project `PATH_add node_modules/.bin` via `direnv` (`.envrc`) or `mise`.
- [ ] **Use `IdentityAgent` in SSH config for 1Password** (`nix/home/shell/fish/conf.d/1password.fish` & `nix/home/ssh/`):
  Setting `SSH_AUTH_SOCK` only in `if status --is-login` Fish shells misses GUI apps (Zed, Fork) and non-login contexts, and can clobber forwarded SSH agents. Configuring `IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"` in `programs.ssh` (guarded by `isDarwin`) works across all tools and shells while still allowing explicit `ForwardAgent` overrides.
- [ ] **Guard Darwin-only paths and check types in `antigravity-hub.nix`** (`nix/home/dev/antigravity/antigravity-hub.nix`):
  Guard the `Library/Application Support/Antigravity/app_storage.json` activation hook with `lib.mkIf pkgs.stdenv.hostPlatform.isDarwin`, and verify whether `autoCheckForUpdates` expects boolean `false` instead of string `"false"`.
- [ ] **Harden `sudo-nopasswd` path resolution** (`nix/flakes/sudo-nopasswd/hm.nix`):
  `hm.nix` resolves entries to `"${profileDirectory}/bin/${item}"`, which breaks if a system binary string (like `"reboot"` in its example) is passed, and relies on profile symlinks rather than immutable `/nix/store` paths (`lib.getExe pkg`).
- [ ] **Review Safari & macOS sandboxed preferences** (`nix/darwin/system/safari.nix`):
  On modern macOS, Safari runs in a container (`~/Library/Containers/com.apple.Safari/...`) and ignores `/Library/Preferences/com.apple.Safari.plist` (`CustomSystemPreferences`) for most user settings; `SendDoNotTrackHTTPHeader` was also removed upstream. Remove the stray `#!/usr/bin/env bash` comment at the top of the attrset.

## CI & Home-Directory Polish

- [ ] **Expand CI flake checks beyond formatting** (`flake.nix` & `.github/workflows/ci.yaml`):
  `checks` in `flake.nix` currently only runs `treefmt`. Adding a Darwin system/home evaluation or build check to `checks.aarch64-darwin` will catch broken Nix module evaluations on PRs before merge.
- [ ] **Optimize `update-flake.yaml` build time** (`.github/workflows/update-flake.yaml`):
  Building every `darwinConfiguration` twice from scratch (`build-current` + `build`) daily on `macos-latest` risks hitting the 30-minute timeout when uncached packages update. Consider running weekly (or caching `/nix/store` with `DeterminateSystems/magic-nix-cache-action` / Cachix).
- [ ] **Optional remaining `$HOME` XDG environment variables** (`nix/home/shell/`):
  If you want to eliminate remaining history/tool dotfiles in `~`:
  - `LESSHISTFILE = "${config.xdg.stateHome}/less/history"` (or `"-"`)
  - `PYTHON_HISTORY = "${config.xdg.stateHome}/python/history"`
  - `NODE_REPL_HISTORY = "${config.xdg.stateHome}/node_repl_history"`
  - `CARGO_HOME = "${config.xdg.dataHome}/cargo"` and `RUSTUP_HOME = "${config.xdg.dataHome}/rustup"` (updating `nix/home/shell/fish/conf.d/rust.fish` to match)
