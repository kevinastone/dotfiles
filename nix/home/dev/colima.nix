{ pkgs, ... }:
{
  home.packages = with pkgs; [
    colima
  ];

  programs.ssh.includes = [ "~/.colima/ssh_config" ];
}
