{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    sqlite
  ];

  xdg.configFile."sqlite/sqliterc".source = ./sqliterc;

  home.sessionVariables.SQLITE_HISTORY = "${config.xdg.stateHome}/sqlite_history";

  home.shellAliases.sqlite3 = "sqlite3 -init ${config.xdg.configHome}/sqlite/sqliterc";
}
