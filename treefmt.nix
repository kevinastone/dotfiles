{ ... }:
{
  projectRootFile = ".git/config";

  programs.nixfmt.enable = true;

  programs.fish_indent.enable = true;

  # programs.shellcheck.enable = true;

  # programs.jsonfmt.enable = true;
  programs.yamlfmt.enable = true;
  # toml formatter
  programs.taplo.enable = true;

  programs.mdformat.enable = true;
}
