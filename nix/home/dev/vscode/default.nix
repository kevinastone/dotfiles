{ lib, ... }:
let
  keybindings = import ./keybindings.nix { inherit lib; };
in
{
  programs.vscode.profiles.default.keybindings = keybindings;
}
