_: {
  programs.antigravity.profiles.default.keybindings = [
    {
      command = "workbench.action.openRecent";
      key = "ctrl+cmd+p";
    }
    {
      key = "ctrl+cmd+up";
      command = "editor.action.moveLinesUpAction";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+cmd+down";
      command = "editor.action.moveLinesDownAction";
      when = "editorTextFocus";
    }
    {
      key = "cmd+shift+d";
      command = "editor.action.copyLinesDownAction";
      when = "editorFocus";
    }
  ];
}
