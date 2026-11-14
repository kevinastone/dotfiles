{
  lib,
  config,
  pkgs,
  ...
}:
let
  jsonFormat = pkgs.formats.json { };
  staticSettings = jsonFormat.generate "kap-config" {
    kapturesDir = "${config.home.homeDirectory}/Downloads";
    openOnStartup = true;
    allowAnalytics = true;
    showCursor = true;
    highlightClicks = false;
  };
in
{
  homebrew.casks = [ "kap" ];

  # Can't use standard home-file since Kap expects a mutable settings config
  # home.file."Library/Application Support/Kap/config.json".source = jsonFormat.generate "kap-config";

  home.activation.kapSettingsActivation = lib.hm.dag.entryAfter [ "linkGeneration" ] (
    lib.hm.generators.mkImpureConfigMerger {
      inherit pkgs staticSettings;
      format = "json";
      empty = "{}";
      jqOperation = "$dynamic * $static";
      path = "${config.home.homeDirectory}/Library/Application Support/Kap/config.json";
    }
  );
}
