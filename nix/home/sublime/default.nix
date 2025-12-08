{ lib, pkgs, ... }:
{
  # Only linux can be installed via nixpkgs
  home.packages = lib.optionals pkgs.stdenv.isLinux [ pkgs.sublime4 ];
  # Use homebrew for MacOS
  homebrew.casks = lib.optionals pkgs.stdenv.isDarwin [ "sublime-text" ];
}
