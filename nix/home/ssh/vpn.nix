{ lib, ... }:
let
  mkJumps = attrs: lib.mapAttrs' mkJump attrs;
  mkJump = host: ip: {
    name = "jump-${host}";
    value = {
      proxyJump = "wireguard.kevinastone.com";
      hostname = ip;
      forwardAgent = true;
    };
  };
in
{
  programs.ssh.matchBlocks = {
    "wireguard.kevinastone.com" = {
      user = "admin";
      forwardAgent = true;
    };
  }
  // mkJumps {
    sprite = "10.200.31.10";
    ser8 = "10.200.31.12";
  };
}
