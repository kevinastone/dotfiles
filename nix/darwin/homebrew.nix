{...}: {
  homebrew = {
    enable = true;
    # onActivation.cleanup = "uninstall";

    taps = [];
    brews = [];
    casks = [
      "1password"
      "alfred"
      "hammerspoon"
      "keepingyouawake"
      "spotify"
      "sublime-text"
      "the-unarchiver"
    ];
    masApps = {
      "PDF Expert" = 1055273043;
      "Pixelmator Pro" = 1289583905;
      "Affinity Designer" = 824171161;
    };
  };
}
