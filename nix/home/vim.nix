{
  pkgs,
  lib,
  config,
  systemSettings,
  ...
}: {
  home.packages = with pkgs; [
    vim
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.file = {
    ".vimrc".source = ../../vimrc;
  };
}
