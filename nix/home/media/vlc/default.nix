{ pkgs, ... }:
let
  preferencesPath =
    if pkgs.stdenv.isDarwin then "Library/Preferences/org.videolan.vlc" else ".config";
in
{
  imports = [
    ../../lib/file-associations.nix
  ];

  home.packages = with pkgs; [
    vlc-bin
  ];

  home.file."${preferencesPath}/vlcrc".source = ./vlcrc;

  file-associations.mp4 = "org.videolan.vlc";
  file-associations.mkv = "org.videolan.vlc";
  file-associations.avi = "org.videolan.vlc";
  file-associations.mov = "org.videolan.vlc";
}
