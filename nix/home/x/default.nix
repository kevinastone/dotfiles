{ lib, pkgs, ... }:
lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
  home.file.".Xmodmap".source = ./Xmodmap;
}
