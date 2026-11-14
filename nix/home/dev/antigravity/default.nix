{ ... }:
{
  imports = [
    # ./git-hook.nix
    ./antigravity-hub.nix
  ];

  programs.antigravity-cli.enable = true;
}
