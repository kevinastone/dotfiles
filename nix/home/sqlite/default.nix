{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sqlite
  ];

  home.file = {
    ".sqliterc".source = ./sqliterc;
  };
}
