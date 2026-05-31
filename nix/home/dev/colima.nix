{ lib, pkgs, ... }:
{
  home.packages =
    with pkgs;
    lib.optionals pkgs.stdenv.isDarwin [
      colima
    ];

  programs.ssh.includes = lib.optionals pkgs.stdenv.isDarwin [ "~/.colima/ssh_config" ];
}
