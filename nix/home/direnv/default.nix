_: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    config.global.hide_env_diff = true;
  };

  xdg.configFile."direnv/lib" = {
    source = ./lib;
    recursive = true;
  };
}

# hide_env_diff = true
