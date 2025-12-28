{
  nix-homebrew,
  username,
  homebrew-core,
  homebrew-cask,
  ...
}:
let
  taps = {
    "homebrew/homebrew-core" = homebrew-core;
    "homebrew/homebrew-cask" = homebrew-cask;
  };
in
{
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        # Install Homebrew under the default prefix
        enable = true;
        # User owning the Homebrew prefix
        user = username;
        inherit taps;
        mutableTaps = false;
        autoMigrate = true;
      };
    }
    ./kya.nix
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
      upgrade = true;
    };
    taps = builtins.attrNames taps;
    brews = [ "mas" ];
  };
}
