{ lib, pkgs, ... }:
let
  preferencesPath =
    if pkgs.stdenv.isDarwin then "Library/Preferences/org.videolan.vlc" else ".config";
  vlcPkg = with pkgs; if stdenv.isDarwin then vlc-bin else vlc;
in
{
  home.packages = [ vlcPkg ];

  home.file."${preferencesPath}/vlcrc".source = ./vlcrc;

  file-associations = lib.genAttrs [
    # keep-sorted start
    "avi"
    "flv"
    "mkv"
    "mov"
    "mp4"
    "wmv"
    # keep-sorted end
  ] (_: "org.videolan.vlc");
}
