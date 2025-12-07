{
  lib,
  config,
  pkgs,
  ...
}:
let
  jsonFormat = pkgs.formats.json { };
  json5 = pkgs.python3Packages.toPythonApplication pkgs.python3Packages.json5;
  impureConfigMerger = empty: jqOperation: path: staticSettings: ''
    mkdir -p $(dirname ${lib.escapeShellArg path})
    if [ ! -e ${lib.escapeShellArg path} ]; then
      # No file? Create it
      echo ${lib.escapeShellArg empty} > ${lib.escapeShellArg path}
    fi
    dynamic="$(${lib.getExe json5} --as-json ${lib.escapeShellArg path} 2>/dev/null || echo ${lib.escapeShellArg empty})"
    static="$(cat ${lib.escapeShellArg staticSettings})"
    config="$(${lib.getExe pkgs.jq} -n ${lib.escapeShellArg jqOperation} --argjson dynamic "$dynamic" --argjson static "$static")"
    printf '%s\n' "$config" > ${lib.escapeShellArg path}
    unset config
  '';
  mkMutableHomeSettings =
    path: settings:
    impureConfigMerger "{}" "$dynamic * $static" "${config.home.homeDirectory}/${path}" settings;
in
{
  homebrew.casks = [ "kap" ];

  # Can't use standard home-file since Kap expects a mutable settings config
  # home.file."Library/Application Support/Kap/config.json".source = jsonFormat.generate "kap-config";

  # Stolen this from zed-editor's mutable settings
  home.activation.kapSettingsActivation = lib.hm.dag.entryAfter [ "linkGeneration" ] (
    mkMutableHomeSettings "Library/Application Support/Kap/config.json" (
      jsonFormat.generate "kap-config" {
        kapturesDir = "${config.home.homeDirectory}/Downloads";
        openOnStartup = true;
        allowAnalytics = true;
        showCursor = true;
        highlightClicks = false;
      }
    )
  );
}
