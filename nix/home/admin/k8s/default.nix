{ pkgs, ... }:
{
  imports = [
    ./k9s
  ];

  home.packages = with pkgs; [
    age
    kubectl
    kubectl-cnpg
    kubectl-rook-ceph
    kustomize
    sops
  ];
}
