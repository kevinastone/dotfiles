{ lib, ... }:
let
  # Fetched from https://github.com/microsoft/vscode-sublime-keybindings/blob/main/package.json
  sublimePackage = lib.importJSON ./vscode-sublime-keybindings/package.json;
  sublimeKeybindings = sublimePackage.contributes.keybindings;
in
{
  programs.antigravity.profiles.default.keybindings = [
    {
      command = "workbench.action.openRecent";
      key = "ctrl+alt+p";
      mac = "ctrl+cmd+p";
    }
  ]
  ++ sublimeKeybindings;
}
