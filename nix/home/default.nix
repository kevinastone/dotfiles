{ ... }:
{
  imports = [
    # keep-sorted start
    ./admin
    ./chrome.nix
    ./dev
    ./direnv
    ./ghostty
    ./git
    ./hammerspoon.nix
    ./icloud.nix
    ./media
    ./scripts
    ./shell
    ./utils
    ./vim
    ./x
    ./xfce4
    ./zed
    # keep-sorted end
  ];

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
