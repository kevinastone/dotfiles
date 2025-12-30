{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
in
{
  programs.ssh.matchBlocks.unifi = {
    host = sshLib.mkHosts [
      "unifi"
      "192.168.20.1"
      "192.168.10.1"
      "ultra"
      "ultra.parents.kevinastone.com"
      "max"
      "max.home.kevinastone.com"
    ];
    user = "root";
  };
}
