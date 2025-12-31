{ lib, pkgs, ... }:
let
  preferencesPath = if pkgs.stdenv.isDarwin then "Library/Application Support/" else ".config";
in
{
  imports = [
    ./cnpg.nix
    ./debug.nix
  ];

  programs.k9s.enable = true;
  programs.k9s.settings.k9s.ui.logoless = true;

  # Workaround for catppuccin/k9s defects
  # https://github.com/catppuccin/k9s/issues/16
  home.file."${preferencesPath}/k9s/skins/catppuccin-mocha.yaml".source =
    lib.mkForce ./catppuccin-mocha.yaml;
}
