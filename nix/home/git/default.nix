{
  pkgs,
  lib,
  config,
  systemSettings,
  ...
}: {

  imports = [
    ./delta.nix
    ./settings.nix
  ];

  home.packages = with pkgs; [
    lazygit
  ];

  programs.git.enable = true;
}
