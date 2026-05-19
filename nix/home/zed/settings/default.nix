{
  agent_servers.gemini.type = "registry";
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
  agent = {
    dock = "right";
    default_model = {
      provider = "google";
      model = "gemini-3-pro-preview";
    };
    enabled = true;
    button = false;
    tool_permissions.default = "allow";
  };
  # Whether to show the collaboration panel button in the status bar.
  collaboration_panel.button = false;
  outline_panel.dock = "right";
  # Allow zed to use direnv to pull in flake dependencies
  load_direnv = "shell_hook";
  inlay_hints.enabled = false;
  languages.Python = {
    language_servers = [
      "pyright"
      "ruff"
    ];
    format_on_save = "on";
    formatter = [
      {
        code_action = "source.organizeImports.ruff";
      }
      {
        code_action = "source.fixAll.ruff";
      }
      {
        language_server.name = "ruff";
      }
    ];
  };
  languages.Nix = {
    language_servers = [
      "nil"
      "nixd"
    ];
    formatter = {
      external = {
        command = "nixfmt";
      };
    };
  };
  lsp.ruff.initialization_options = {
    settings = {
      # Ruff server settings goes here
      lint = {
        extendSelect = [ "I" ];
      };
    };
  };
}
