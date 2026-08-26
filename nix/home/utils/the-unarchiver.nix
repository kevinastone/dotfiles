{ lib, pkgs, ... }:
{
  home.packages =
    with pkgs;
    lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      the-unarchiver
    ];
}
