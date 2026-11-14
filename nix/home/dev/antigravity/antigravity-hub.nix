{
  lib,
  config,
  pkgs,
  ...
}:
let
  jsonFormat = pkgs.formats.json { };
  staticSettings = jsonFormat.generate "antigravity-hub-app-storage" {
    autoCheckForUpdates = "false";
  };
in
{
  home.packages = with pkgs; [ antigravity-hub ];

  home.activation.antigravityHubSettingsActivation = lib.hm.dag.entryAfter [ "linkGeneration" ] (
    lib.hm.generators.mkImpureConfigMerger {
      inherit pkgs staticSettings;
      format = "json";
      empty = "{}";
      jqOperation = "$dynamic * $static";
      path = "${config.home.homeDirectory}/Library/Application Support/Antigravity/app_storage.json";
    }
  );
}
