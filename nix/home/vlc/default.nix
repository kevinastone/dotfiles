{ pkgs, ... }: {

  imports = [
    ../file-associations.nix
  ];

  home.packages = with pkgs; [
    vlc-bin
  ];

  home.file."Library/Preferences/org.videolan.vlc/vlcrc".source = ./vlcrc;

  file-associations.mp4 = "org.videolan.vlc";
  file-associations.mkv = "org.videolan.vlc";
  file-associations.avi = "org.videolan.vlc";
  file-associations.mov = "org.videolan.vlc";
}
