{ pkgs, ... }: {
  home.packages = with pkgs; [
    pkgs.nixfmt-rfc-style
  ];
}
