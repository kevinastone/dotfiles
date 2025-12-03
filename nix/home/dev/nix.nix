{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nil
    nixd
  ];
}
