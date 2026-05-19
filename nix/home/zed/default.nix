{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    mutableUserKeymaps = false;
    mutableUserSettings = false;
    extensions = [
      "html"
      "dockerfile"
      "git-firefly"
      "ruff"
      "sql"
      "toml"
    ];
    userSettings = import ./settings;
    userKeymaps = import ./keymap.nix;
    extraPackages = with pkgs; [
      python3
      nil
      nixd
    ];
  };
}
