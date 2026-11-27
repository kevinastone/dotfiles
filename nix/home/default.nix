{
  # Defaults in every home-manager configuration
  imports = [
    # keep-sorted start
    ./direnv
    ./git
    ./shell
    ./ssh
    ./utils
    ./vim
    # keep-sorted end
  ];

  home.stateVersion = "26.05"; # Please read the comment before changing.

  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
