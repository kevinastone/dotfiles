{ pkgs, ... }: {

  home.packages = with pkgs; [
    yt-dlp
  ];

  xdg.configFile."yt-dlp/config".source = ./config;
}
