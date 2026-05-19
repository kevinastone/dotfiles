_: {
  imports = [
    ./agent.nix
    ./keymap.nix
    ./languages
    ./settings.nix
  ];
  programs.zed-editor = {
    enable = true;
    mutableUserKeymaps = false;
    mutableUserSettings = false;
  };
}
