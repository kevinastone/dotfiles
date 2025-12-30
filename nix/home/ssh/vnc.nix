{ lib, ... }:
let
  sshLib = import ./lib.nix { inherit lib; };
  localForwards = [
    {
      bind.port = 5900;
      host.address = "localhost";
      host.port = 5900;
    }
  ];
in
{
  programs.ssh.matchBlocks.sprite = {
    host = sshLib.mkHosts [
      "sprite"
      "jump-sprite"
      "sprite.parents.kevinastone.com"
    ];
    inherit localForwards;
  };
}
