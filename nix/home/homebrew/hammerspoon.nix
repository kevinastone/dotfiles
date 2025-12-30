{
  self,
  lib,
  pkgs,
  ...
}:
{
  homebrew.casks = [ "hammerspoon" ];

  home.file.".hammerspoon" = lib.mkIf pkgs.stdenv.isDarwin {
    source = self + "/hammerspoon";
    recursive = true;
  };
}
