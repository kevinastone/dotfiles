{ lib, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = with pkgs; google-chrome;
  };

  home.file."Library/Services" = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    source = ./services;
    recursive = true;
  };
}
