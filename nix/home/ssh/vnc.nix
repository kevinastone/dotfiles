{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
  vncHosts = sshLib.mkHosts [
    "sprite"
    "jump-sprite"
    "sprite.parents.kevinastone.com"
  ];
  LocalForward = [
    {
      bind.port = 5900;
      host.address = "localhost";
      host.port = 5900;
    }
  ];
in
{
  programs.ssh.settings."${vncHosts}" = {
    inherit LocalForward;
  };
}
