{
  pkgs,
  lib,
  config,
  systemSettings,
  ...
}:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    # extraConfig = builtins.readFile ./vimrc;
  };
}
