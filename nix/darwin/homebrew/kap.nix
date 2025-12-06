{ ... }:
let
  settings = {
    kapturesDir = "~/Downloads";
    openOnStartup = true;
    allowAnalytics = true;
    showCursor = true;
    highlightClicks = false;
  };
in
{
  homebrew.casks = [
    "kap"
  ];

  # TODO: Need to link with home-manager
  # home.file."Library/Application Support/Kap/Settings".text = builtins.toJSON settings;
}
