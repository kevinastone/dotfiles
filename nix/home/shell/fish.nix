{ ... }: {
  programs.fish = {
    enable = true;
  };

  # Disable conf.d as it's specialized against nix solutions
  # xdg.configFile."fish/conf.d" = {
  #   source = ../../../config/fish/conf.d;
  #   recursive = true;
  # };
  xdg.configFile."fish/functions" = {
    source = ../../../config/fish/functions;
    recursive = true;
  };
  xdg.configFile."fish/completions" = {
    source = ../../../config/fish/completions;
    recursive = true;
  };
}
