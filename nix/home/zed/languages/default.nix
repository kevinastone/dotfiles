_: {
  imports = [
    # keep-sorted start
    ./nix.nix
    ./python.nix
    # keep-sorted end
  ];

  programs.zed-editor.extensions = [
    # keep-sorted start
    "cue"
    "dockerfile"
    "git-firefly"
    "html"
    "sql"
    "toml"
    # keep-sorted end
  ];
}
