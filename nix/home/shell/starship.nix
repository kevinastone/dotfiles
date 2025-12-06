{ lib, rootPath, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = lib.importTOML (rootPath "config/starship.toml");
  };

  # xdg.configFile."starship.toml".source = rootPath "config/starship.toml";
}
