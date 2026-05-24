{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
  localHosts = sshLib.mkHosts [
    "*.home.kevinastone.com"
    "*.parents.kevinastone.com"
    "*.local"
  ];
in
{
  programs.ssh.settings."${localHosts}" = {
    forwardAgent = true;
  };
}
