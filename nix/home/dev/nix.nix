{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt
    nil
    nixd
  ];
}
