_: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # cleanup = "zap";
      upgrade = true;
    };
    taps = [ ];
    brews = [ ];
    casks = [
      # keep-sorted start
      "1password"
      "1password-cli"
      "alfred"
      "hammerspoon"
      "keepingyouawake"
      "spotify"
      "sublime-text"
      "the-unarchiver"
      # keep-sorted end
    ];
    masApps = {
      "1Password for Safari" = 1569813296;
      "PDF Expert" = 1055273043;
      "Pixelmator Pro" = 1289583905;
      "Affinity Designer" = 824171161;
    };
  };
}
