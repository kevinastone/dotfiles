{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
in
{
  programs.ssh.matchBlocks."192.168.120.3" = sshLib.ignoreHostKeys;
}
