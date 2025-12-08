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
    masApps = {
      "PDF Expert" = 1055273043;
      "Pixelmator Pro" = 1289583905;
      "Affinity Designer" = 824171161;
    };
  };
}
