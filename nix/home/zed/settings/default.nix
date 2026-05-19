args@{ lib, ... }:
lib.mkMerge [
  {
    edit_predictions.provider = "none";
    ui_font_size = 15;
    buffer_font_size = 12;
    base_keymap = "SublimeText";
    double_click_in_multibuffer = "open";
    scrollbar.show = "system";
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
    minimap.show = "always";
    project_panel = {
      dock = "left";
      folder_icons = false;
      auto_reveal_entries = false;
      indent_size = 15;
    };
    # Whether to show the collaboration panel button in the status bar.
    collaboration_panel.button = false;
    outline_panel.dock = "right";
    # Allow zed to use direnv to pull in flake dependencies
    load_direnv = "shell_hook";
    inlay_hints.enabled = false;
  }
  (import ./agent.nix args)
  (import ./languages args)
]
