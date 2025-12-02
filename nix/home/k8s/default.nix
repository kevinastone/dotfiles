{ pkgs, ... }: {
  home.packages = with pkgs; [
    kubectl
  ];

  programs.k9s.enable = true;
}
