{
  lib,
  pkgs,
  rootPath,
  ...
}:
{
  home.file.".hammerspoon" = lib.mkIf pkgs.stdenv.isDarwin {
    source = rootPath "hammerspoon";
    recursive = true;
  };
}
