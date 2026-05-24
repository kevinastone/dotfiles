{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
in
{
  programs.ssh.settings."raspberrypi.local" = sshLib.ignoreHostKeys;
}
