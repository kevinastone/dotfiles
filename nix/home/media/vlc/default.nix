{ lib, pkgs, ... }:
let
  preferencesPath =
    if pkgs.stdenv.isDarwin then "Library/Preferences/org.videolan.vlc" else ".config";
in
{
  home.packages = with pkgs; [
    vlc-bin
  ];

  home.file."${preferencesPath}/vlcrc".source = ./vlcrc;

  file-associations = lib.genAttrs [
    # keep-sorted start
    "avi"
    "mkv"
    "mov"
    "mp4"
    "wmv"
    # keep-sorted end
  ] (_: "org.videolan.vlc");
}
