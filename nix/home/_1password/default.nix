{ lib, pkgs, ... }:
{
  # Only linux can be installed via nixpkgs
  home.packages = lib.optionals pkgs.stdenv.isLinux [
    pkgs._1password-gui
    pkgs._1password-cli
  ];

  # Use homebrew for MacOS
  homebrew.casks = lib.optionals pkgs.stdenv.isDarwin [
    "1password"
    "1password-cli"
  ];

  homebrew.masApps = lib.mkIf pkgs.stdenv.isDarwin {
    "1Password for Safari" = 1569813296;
  };
}
