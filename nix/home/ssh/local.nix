{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
in
{
  programs.ssh.matchBlocks.local = {
    host = sshLib.mkHosts [
      "*.home.kevinastone.com"
      "*.parents.kevinastone.com"
      "*.local"
      "mini"
      "bedroom"
      "scoreboard"
    ];
    forwardAgent = true;
  };
}
