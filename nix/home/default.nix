{ config, pkgs, ... }: {
  imports = [
    ./chrome.nix
    ./direnv
    ./ghostty
    ./git
    ./hammerspoon.nix
    ./htop.nix
    ./icloud.nix
    ./packages.nix
    ./python
    ./shell
    ./sqlite
    ./tmux
    ./vim
    ./vlc
    ./xfce4
    ./x
    ./yt-dlp
    ./zed
  ];

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
