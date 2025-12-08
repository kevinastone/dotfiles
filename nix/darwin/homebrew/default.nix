{ nix-homebrew, username, ... }:
{
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        # Install Homebrew under the default prefix
        enable = true;
        # User owning the Homebrew prefix
        user = username;
        # Automatically migrate existing Homebrew installations
        autoMigrate = true;
      };
    }
    ./kya.nix
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    taps = [ ];
    brews = [ "mas" ];
    casks = [
      # keep-sorted start
      "1password"
      "1password-cli"
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
