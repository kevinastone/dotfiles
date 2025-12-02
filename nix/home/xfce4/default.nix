{ lib, pkgs, ... }: lib.mkIf pkgs.stdenv.isLinux {
  xdg.configFile."xfce4/xfconf" = {
    source = ./xfconf;
    recursive = true;
  };
}
