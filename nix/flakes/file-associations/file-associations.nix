{
  lib,
  config,
  pkgs,
  ...
}:

let
  inherit (lib)
    literalExpression
    mkIf
    mkOption
    types
    ;

  cfg = config.file-associations;

  extensions = lib.concatLines (lib.mapAttrsToList (ext: bundleId: "${bundleId} ${ext} all") cfg);

  # Create the config file purely in the Nix store
  dutiConfigFile = pkgs.writeText "duti-config" extensions;
in
{
  options.file-associations = mkOption {
    type = with types; attrsOf str;
    default = { };
    example = literalExpression ''
      {
        mp4 = "org.videolan.vlc";
        https = "com.google.Chrome";
      }
    '';
    description = ''
      List of file extensions mapped to default programs.
    '';
  };

  config = mkIf (cfg != { }) {
    home.packages = with pkgs; [
      duti
    ];

    # Run duti during home-manager activation
    home.activation = {
      applyFileAssociations = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        echo "Applying file associations with duti"
        # $DRY_RUN_CMD is used so this doesn't run during a dry-run build
        $DRY_RUN_CMD ${pkgs.duti}/bin/duti ${dutiConfigFile}
      '';
    };
  };
}
