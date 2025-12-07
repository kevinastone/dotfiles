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

  options.homebrew.masApps = mkOption {
    type = with types; attrsOf ints.positive;
    default = { };
    example = literalExpression ''
      {
        "1Password for Safari" = 1569813296;
      }
    '';
    description = ''
      List of Mac App Store app to have homebrew install on behalf of home-manager.
    '';
  };
}
