{ pkgs, ... }:
{
  imports = [
    ./delta.nix
  ];

  home.packages = with pkgs; [
    lazygit
  ];

  programs.git.enable = true;
  programs.git.ignores = [ ".DS_Store" ];
  # Keep bulk git config external for better re-use
  programs.git.includes = [
    {
      path = ../../../config/git/config;
    }
  ];
}
