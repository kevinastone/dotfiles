{ ... }: {
  imports = [
    ./file-associations.nix
    ./sudo-nopasswd.nix
  ] ++ [
    ./chrome.nix
    ./direnv
    ./ghostty
    ./git
    ./hammerspoon.nix
    ./htop.nix
    ./icloud.nix
    ./k8s
    ./node
    ./python
    ./shell
    ./sqlite
    ./tmux
    ./utils.nix
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
