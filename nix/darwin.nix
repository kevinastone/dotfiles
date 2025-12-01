{ self, pkgs, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  system.primaryUser = "kstone";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # MacOS System Preferences
  system.defaults = {
    dock = {
      show-recents = false;
    };
    finder = {
      ShowPathbar = true;
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Declare the user that will be running `nix-darwin`.
  users.users.kstone = {
      name = "kstone";
      home = "/Users/kstone";
  };

  environment.systemPackages =
    [ pkgs.vim
      pkgs.fish
      pkgs.starship
    ];

  environment.defaultPackages = [ pkgs.neofetch ];

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
