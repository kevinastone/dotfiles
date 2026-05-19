_: {
  projectRootFile = ".git/config";

  programs.fish_indent.enable = true;
  # programs.shellcheck.enable = true;

  # JSON formatter
  programs.biome.enable = true;
  programs.biome.settings.formatter = {
    indentStyle = "space";
    indentWidth = 2;
  };

  # YAML formatter
  programs.yamlfmt.enable = true;
  programs.yamlfmt.settings.formatter = {
    retain_line_breaks_single = true;
  };

  # toml formatter
  programs.taplo.enable = true;

  programs.mdformat.enable = true;

  programs.keep-sorted.enable = true;

  # Nix formatters
  programs.nixfmt.enable = true;
  programs.statix.enable = true;
  programs.deadnix.enable = true;
  settings.formatter = {
    deadnix.priority = 1;
    statix.priority = 2;
    nixfmt.priority = 3;
  };
}
