{
  languages.Nix = {
    language_servers = [
      "nil"
      "nixd"
    ];
    formatter.external.command = "nixfmt";
  };
}
