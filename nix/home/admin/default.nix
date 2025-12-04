{ pkgs, ... }:
{
  imports = [
    # keep-sorted start
    ./ansible.nix
    ./k8s
    ./lego.nix
    ./siege.nix
    # keep-sorted end
  ];

  home.packages = with pkgs; [
    arping
  ];
}
