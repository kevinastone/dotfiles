{ pkgs, ... }:
{
  imports = [
    ./ansible.nix
    ./k8s
    ./lego.nix
    # ./siege.nix
  ];

  home.packages = with pkgs; [
    arping
  ];
}
