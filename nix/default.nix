{ pkgs, ... }:
{
  imports = [
    ./overlays
  ];

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 30d";
  };

  environment.systemPackages = with pkgs; [
    curl
    htop
    pstree
    tree
    vim
    watch
    wget
  ];

  environment.variables.EDITOR = "vim";
}
