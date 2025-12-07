{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    (spotify.overrideAttrs (
      oldAttrs:
      lib.optionalAttrs pkgs.stdenv.isDarwin {
        src = pkgs.fetchurl {
          inherit (oldAttrs.src) url;
          hash = "sha256-0gwoptqLBJBM0qJQ+dGAZdCD6WXzDJEs0BfOxz7f2nQ=";
        };
      }
    ))
  ];
}
