{ pkgs, ... }: {
  imports = [
    ./ffmpeg.nix
    ./scripts
    ./vlc
    ./yt-dlp
  ];

  home.packages = with pkgs; [
    # keep-sorted start
    rename
    # keep-sorted end
  ];
}
