{ pkgs, ... }:
{
  imports = [
    ./k9s
  ];

  home.packages = with pkgs; [
    kubectl
    kubectl-cnpg
    kubectl-rook-ceph
    kustomize
  ];
}
