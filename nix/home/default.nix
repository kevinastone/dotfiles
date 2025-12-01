{ config, pkgs, ... }: {
  imports = [
    ./direnv.nix
    ./git.nix
    ./htop.nix
    ./shell
    ./vim.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
