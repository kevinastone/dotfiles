{ pkgs, ... }:
{
  programs.htop.enable = true;

  sudo.nopasswd.executables = with pkgs; [ htop ];
}
