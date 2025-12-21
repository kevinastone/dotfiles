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

  xdg.configFile.zed = {
    source = ./zed;
    recursive = true;
  };
}
