{ pkgs, ... }:
{
  imports = [
    # ./git-hook.nix
  ];

  programs.antigravity-cli.enable = true;

  home.packages = with pkgs; [ antigravity-hub ];
}
