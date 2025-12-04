_: {
  programs.fish = {
    enable = true;
  };

  # Disable conf.d as it's specialized against nix solutions
  xdg.configFile."fish/conf.d" = {
    source = ./conf.d;
    recursive = true;
  };
  xdg.configFile."fish/functions" = {
    source = ./functions;
    recursive = true;
  };
  xdg.configFile."fish/completions" = {
    source = ./completions;
    recursive = true;
  };
}
