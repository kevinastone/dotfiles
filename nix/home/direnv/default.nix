_: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  xdg.configFile."direnv/lib" = {
    source = ./lib;
    recursive = true;
  };
}
