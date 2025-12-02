{ config, pkgs, zed-extensions, ... }: {
  imports = [
    ./direnv
    ./ghostty
    ./git
    ./htop.nix
    ./packages.nix
    ./python
    ./shell
    ./sqlite
    ./tmux
    ./vim
    ./vlc
    ./yt-dlp
    ./zed
  ];

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
