{ lib, pkgs, ... }:
{
  home.packages =
    with pkgs;
    lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      colima
    ];

  programs.ssh.includes = lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ "~/.colima/ssh_config" ];
}
