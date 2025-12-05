_: {
  # Defaults in every home-manager configuration
  imports = [
    # keep-sorted start
    ./direnv
    ./git
    ./shell
    ./utils
    ./vim
    # keep-sorted end
  ];

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
