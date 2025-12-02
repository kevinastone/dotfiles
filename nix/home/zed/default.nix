{ pkgs, ... }: {

  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile.zed = {
    source = ./zed;
    recursive = true;
  };
}
