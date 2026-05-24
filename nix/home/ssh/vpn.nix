{ lib, ... }:
let
  mkJumps = attrs: lib.mapAttrs' mkJump attrs;
  mkJump = host: ip: {
    name = "jump-${host}";
    value = {
      ProxyJump = "wireguard.kevinastone.com";
      HostName = ip;
      ForwardAgent = true;
    };
  };
in
{
  programs.ssh.settings = {
    "wireguard.kevinastone.com" = {
      User = "admin";
      ForwardAgent = true;
    };
  }
  // mkJumps {
    sprite = "10.200.31.10";
    ser8 = "10.200.31.12";
  };
}
