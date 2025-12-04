{ ... }:
{
  imports = [
    # keep-sorted start
    ./fish
    ./starship.nix
    ./ulimit.nix
    ./workon.nix
    ./zsh.nix
    # keep-sorted end
  ];

  home.file.".hushlogin".text = "";
  home.file.".inputrc".source = ./inputrc;
}
