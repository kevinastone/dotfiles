{ pkgs, ... }:
{
  imports = [
    ./k9s
  ];

  home.packages = with pkgs; [
    # keep-sorted start
    age
    kubectl
    kubectl-cnpg
    kubectl-rook-ceph
    kustomize
    sops
    # keep-sorted end
  ];
}
