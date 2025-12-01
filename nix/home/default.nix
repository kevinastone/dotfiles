{ config, pkgs, ... }: {
  imports = [
    ./direnv
    ./ghostty
    ./git
    ./htop.nix
    ./packages.nix
    ./shell
    ./sqlite
    ./tmux
    ./vim
    ./yt-dlp
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
