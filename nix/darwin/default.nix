{ pkgs, ... }: {
  imports = [
    ./apps.nix
    ./fonts.nix
    ./homebrew.nix
    ./system
  ];

  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  system.primaryUser = "kstone";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.shells = [
    pkgs.fish
  ];

  # Declare the user that will be running `nix-darwin`.
  users.users.kstone = {
      name = "kstone";
      home = "/Users/kstone";
      shell = pkgs.fish;
  };
}
