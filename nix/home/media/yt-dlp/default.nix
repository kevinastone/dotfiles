{ pkgs, ... }:
{

  home.packages = with pkgs; [
    (yt-dlp.override {
      withAlias = true;
    })
  ];

  xdg.configFile."yt-dlp/config".source = ./config;
}
