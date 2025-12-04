{ pkgs, ... }:
{

  home.packages = with pkgs; [
    yt-dlp
  ];

  home.shellAliases."youtube-dl" = "yt-dlp";

  xdg.configFile."yt-dlp/config".source = ./config;
}
