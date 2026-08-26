{ lib, pkgs, ... }:
{
  programs.fish.shellInit = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin ''
    ulimit -n 10000
  '';
}
