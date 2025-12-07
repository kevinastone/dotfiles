{
  lib,
  ...
}:

let
  inherit (lib)
    literalExpression
    mkOption
    types
    ;
in
{
  options.homebrew.casks = mkOption {
    type = with types; listOf str;
    default = [ ];
    example = literalExpression ''
      [
        "alfred"
        "hammerspoon"
        "keepingyouawake"
        "spotify"
      ]
    '';
    description = ''
      List of casks to have homebrew install on behalf of home-manager.
    '';
  };
}
