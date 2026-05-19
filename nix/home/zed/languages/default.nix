_: {
  imports = [
    # keep-sorted start
    ./nix.nix
    ./python.nix
    # keep-sorted end
  ];

  programs.zed-editor.extensions = [
    "html"
    "dockerfile"
    "git-firefly"
    "sql"
    "toml"
  ];
}
