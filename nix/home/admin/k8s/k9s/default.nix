{
  config,
  lib,
  pkgs,
  ...
}:
let
  enableXdgConfig = !pkgs.stdenv.hostPlatform.isDarwin || config.xdg.enable;
in
{
  imports = [
    ./argo-workflows.nix
    ./cnpg.nix
    ./debug.nix
    ./dive.nix
  ];

  programs.k9s.enable = true;
  programs.k9s.settings.k9s.ui.logoless = true;

  # Workaround for catppuccin/k9s defects
  # https://github.com/catppuccin/k9s/issues/16
  xdg.configFile = lib.mkIf enableXdgConfig {
    "k9s/skins/catppuccin-mocha.yaml".source = lib.mkForce ./catppuccin-mocha.yaml;
  };
  home.file = lib.mkIf (!enableXdgConfig) {
    "Library/Application Support/k9s/skins/catppuccin-mocha.yaml".source =
      lib.mkForce ./catppuccin-mocha.yaml;
  };
}
