{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
in
{
  programs.ssh.matchBlocks."raspberrypi.local" = sshLib.ignoreHostKeys;
}
