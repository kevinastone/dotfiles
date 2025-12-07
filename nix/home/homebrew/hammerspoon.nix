{
  lib,
  pkgs,
  rootPath,
  ...
}:
{
  homebrew.casks = [ "hammerspoon" ];

  home.file.".hammerspoon" = lib.mkIf pkgs.stdenv.isDarwin {
    source = rootPath "hammerspoon";
    recursive = true;
  };
}
