{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    (siege.overrideAttrs {
      # Workaround for broken nixpkgs siege
      # https://github.com/NixOS/nixpkgs/issues/286775
      # Borrowed solution from homebrew: https://github.com/Homebrew/homebrew-core/blob/1c7c95183c0984a84b1680422afab6578c300a27/Formula/s/siege.rb#L31
      CFLAGS = lib.optionalString stdenv.cc.isClang "-Wno-int-conversion";
    })
  ];
}
