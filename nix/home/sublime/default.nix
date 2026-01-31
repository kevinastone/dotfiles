{ lib, pkgs, ... }:
let
  preferencesPath =
    if pkgs.stdenv.isDarwin then "Library/Application Support/Sublime Text" else ".config/sublime-text";
in
{
  # Only linux can be installed via nixpkgs
  home.packages = lib.optionals pkgs.stdenv.isLinux [ pkgs.sublime4 ];
  # Use homebrew for MacOS
  homebrew.casks = lib.optionals pkgs.stdenv.isDarwin [ "sublime-text" ];

  # Rely on sublime to merge configuration from other Packages
  home.file."${preferencesPath}/Packages/Declarative/Preferences.sublime-settings".source =
    ./Preferences.sublime-settings;

  home.file."${preferencesPath}/Packages/User" = {
    source = ./User;
    recursive = true;
  };
}
