{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf pkgs.stdenv.isDarwin {
  # Make a friendlier symlink for the iCloud Drive folder.
  home.file."iCloud".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Library/Mobile Documents/com~apple~CloudDocs";
}
