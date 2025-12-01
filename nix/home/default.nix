{ config, pkgs, ... }: {
  imports = [
    ./direnv.nix
    ./ghostty.nix
    ./git
    ./htop.nix
    ./packages.nix
    ./shell
    ./sqlite.nix
    ./tmux.nix
    ./vim.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
