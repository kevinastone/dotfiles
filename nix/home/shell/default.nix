{ ... }:
{
  imports = [
    ./fish
    ./starship.nix
    ./ulimit.nix
    ./workon.nix
    ./zsh.nix
  ];

  home.file.".hushlogin".text = "";
  home.file.".inputrc".source = ./inputrc;
}
