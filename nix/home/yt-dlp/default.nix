{ pkgs, ... }: {

  home.packages = with pkgs; [
    yt-dlp
  ];

  programs.fish.shellAliases."youtube-dl" = "yt-dlp";

  xdg.configFile."yt-dlp/config".source = ./config;
}
