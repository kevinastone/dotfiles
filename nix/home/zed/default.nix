{ pkgs, ... }:
{

  programs.zed-editor = {
    enable = true;
    mutableUserKeymaps = false;
    mutableUserSettings = false;
    extraPackages = with pkgs; [
      python3
      nil
      nixd
    ];
  };

  home.shellAliases.zed = pkgs.zed-editor.meta.mainProgram;

  xdg.configFile.zed = {
    source = ./zed;
    recursive = true;
  };
}
