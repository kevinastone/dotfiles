_: {
  projectRootFile = ".git/config";

  programs.fish_indent.enable = true;
  # programs.shellcheck.enable = true;

  # programs.jsonfmt.enable = true;
  programs.yamlfmt.enable = true;
  # toml formatter
  programs.taplo.enable = true;

  programs.mdformat.enable = true;

  programs.keep-sorted.enable = true;

  programs.nixfmt.enable = true;
  programs.statix.enable = true;
  programs.deadnix.enable = true;

  settings.formatter = {
    deadnix.priority = 1;
    statix.priority = 2;
    nixfmt.priority = 3;
  };
}
