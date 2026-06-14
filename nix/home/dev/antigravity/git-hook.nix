{
  config,
  pkgs,
  lib,
  ...
}:
let
  git = config.programs.git.package;
  agy = config.programs.antigravity-cli.package;
  hook = pkgs.writeShellApplication {
    name = "prepare-commit-msg";
    runtimeInputs = [
      git
      agy
    ];
    text = builtins.readFile ./git-hook.sh;
  };
in
{
  programs.git.hooks.prepare-commit-msg = lib.getExe hook;
}
