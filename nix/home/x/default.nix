{ lib, pkgs, ... }: lib.mkIf pkgs.stdenv.isLinux {
  home.file.".Xmodmap".source = ./Xmodmap;
}
