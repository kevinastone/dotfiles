{ ... }:
{
  imports = [
    ./lib
  ]
  ++ [
    ./admin
    ./bat.nix
    ./chrome.nix
    ./dev
    ./direnv
    ./duckdb.nix
    ./ghostty
    ./git
    ./hammerspoon.nix
    ./htop.nix
    ./icloud.nix
    ./k8s
    ./media
    ./shell
    ./sqlite
    ./tmux
    ./utils.nix
    ./vim
    ./xfce4
    ./x
    ./zed
  ];

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
