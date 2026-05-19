{ lib, ... }:
lib.mkMerge [
  # keep-sorted start
  (import ./nix.nix)
  (import ./python.nix)
  # keep-sorted end
]
