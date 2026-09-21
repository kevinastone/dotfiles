{ pkgs, ... }: {
  imports = [
    ./ffmpeg.nix
    ./vlc
    ./yt-dlp
  ];

  home.packages = with pkgs; [
    # keep-sorted start
    rename
    # keep-sorted end
  ];
}
