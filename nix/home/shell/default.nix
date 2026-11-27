{ config, ... }:
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
  xdg.configFile."readline/inputrc".source = ./inputrc;
  home.sessionVariables.INPUTRC = "${config.xdg.configHome}/readline/inputrc";
}
