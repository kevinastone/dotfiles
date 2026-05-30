{ pkgs, ... }:
{
  home.packages = with pkgs; [
    antigravity
    antigravity-cli
  ];
}
