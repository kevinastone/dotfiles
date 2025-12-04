{ ... }:
{
  imports = [
    ./cnpg.nix
    ./debug.nix
  ];

  programs.k9s.enable = true;
}
