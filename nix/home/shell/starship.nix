{ lib, self, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = lib.importTOML (self + "/config/starship.toml");
  };

  # xdg.configFile."starship.toml".source = self + "/config/starship.toml";
}
