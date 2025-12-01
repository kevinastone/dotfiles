{...}: {
  homebrew = {
    enable = true;
    # onActivation.cleanup = "uninstall";

    taps = [];
    brews = [];
    casks = [
      "1password"
      "alfred"
      "ghostty"
      "hammerspoon"
      "keepingyouawake"
      "spotify"
      "sublime-text"
      "the-unarchiver"
      "vlc"
    ];
    masApps = {
      "PDF Expert" = 1055273043;
      "Pixelmator Pro" = 1289583905;
      "Affinity Designer" = 824171161;
    };
  };
}
