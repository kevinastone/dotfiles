{ ... }:
{
  imports = [
    ./lib
  ]
  ++ [
    ./admin
    ./chrome.nix
    ./dev
    ./direnv
    ./ghostty
    ./git
    ./hammerspoon.nix
    ./icloud.nix
    ./media
    ./shell
    ./utils
    ./vim
    ./xfce4
    ./x
    ./zed
  ];

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
