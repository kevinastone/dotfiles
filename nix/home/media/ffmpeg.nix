{ pkgs, ... }:
let
  title-rename = pkgs.writeShellApplication {
    name = "title-rename";
    runtimeInputs = with pkgs; [
      ffmpeg
    ];
    text = builtins.readFile ./title-rename.sh;
  };
in
{
  home.packages = with pkgs; [
    ffmpeg
    title-rename
  ];
}
