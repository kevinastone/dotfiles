{ ... }:
{
  imports = [
    ./cnpg.nix
    ./debug.nix
  ];

  programs.k9s.enable = true;
  programs.k9s.settings.k9s = {
    ui.logoless = true;
  };
}
