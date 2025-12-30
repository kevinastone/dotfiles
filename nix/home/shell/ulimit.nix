{ lib, pkgs, ... }:
{
  programs.fish.shellInit = lib.mkIf pkgs.stdenv.isDarwin ''
    ulimit -n 10000
  '';
}
