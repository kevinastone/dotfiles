{ rootPath, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  xdg.configFile."starship.toml".source = rootPath "config/starship.toml";
}
