{ lib, self, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = lib.importTOML (self + "/config/starship.toml");
  };
}
