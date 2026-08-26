{ lib, pkgs, ... }:
lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
  xdg.configFile."xfce4/xfconf" = {
    source = ./xfconf;
    recursive = true;
  };
}
