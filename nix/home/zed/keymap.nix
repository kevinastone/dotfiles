# Zed keymap
#
# For information on binding keys, see the Zed
# documentation: https://zed.dev/docs/key-bindings
#
# To see the default key bindings run `zed: open default keymap`
# from the command palette.
_:
let
  keymap = {
    Workspace = {
      "cmd-ctrl-p" = "projects::OpenRecent";
    };

    Editor = {
      "cmd-ctrl-p" = "projects::OpenRecent";
      "ctrl-cmd-g" = "editor::SelectAllMatches";
    };

    Pane = {
      "ctrl-s" = "pane::RevealInProjectPanel";
      "ctrl-cmd-w" = "pane::CloseAllItems";
    };

    # Bindings with no specific context
    Global = {
      "cmd-alt-g" = [
        "agent::NewExternalAgentThread"
        { agent.custom.name = "gemini"; }
      ];
    };
  };
in
builtins.attrValues (
  builtins.mapAttrs (
    context: bindings:
    if context == "Global" then { inherit bindings; } else { inherit context bindings; }
  ) keymap
)
