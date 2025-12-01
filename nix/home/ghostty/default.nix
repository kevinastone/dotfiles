{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
  };

  xdg.configFile."ghostty/config".source = ./config;
}
