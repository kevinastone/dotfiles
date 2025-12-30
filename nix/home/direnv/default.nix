_: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global.hide_env_diff = true;
  };

  xdg.configFile."direnv/lib" = {
    source = ./lib;
    recursive = true;
  };
}
