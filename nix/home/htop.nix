{ pkgs, ...}: {
  imports = [
    ./sudo-nopasswd.nix
  ];

  programs.htop.enable = true;

  sudo.nopasswd.executables = with pkgs; [ htop ];
}
