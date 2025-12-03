{ pkgs, ... }:
{
  home.packages = with pkgs; [
    duckdb
  ];
}
