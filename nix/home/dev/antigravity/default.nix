{
  ...
}:
{
  imports = [
    ./git-hook.nix
    ./keybindings.nix
  ];

  programs.antigravity-cli.enable = true;
  # Use homebrew to get antigravity-2.0 until nixpkgs/home-manager sorts it out
  homebrew.casks = [ "antigravity" ];

  #   programs.antigravity = {
  #     enable = false;
  #     mutableExtensionsDir = false;
  #     profiles.default = {
  #       enableUpdateCheck = false;
  #       enableExtensionUpdateCheck = false;
  #       extensions = with pkgs.vscode-extensions; [
  #         # keep-sorted start
  #         astro-build.astro-vscode
  #         biomejs.biome
  #         bradlc.vscode-tailwindcss
  #         charliermarsh.ruff
  #         github.vscode-github-actions
  #         golang.go
  #         hashicorp.hcl # TODO: Replace with "opentofu.vscode-opentofu" when available
  #         jnoortheen.nix-ide
  #         llvm-vs-code-extensions.vscode-clangd
  #         # "meta.pyrefly"
  #         ms-pyright.pyright
  #         ms-python.python
  #         ms-python.vscode-python-envs
  #         # "ms-vscode.sublime-keybindings"
  #         # redhat-java
  #         rust-lang.rust-analyzer
  #         shopify.ruby-lsp
  #         # keep-sorted end
  #       ];
  #     };
  #   };
  #   # home.file.".gemini/antigravity-cli/settings.json".text = lib.toJSON {
  #   #   enableTelemetry = false;
  #   #   enableTerminalSandbox = true;
  #   #   "files.dialog.defaultPath" = "${config.home.homeDirectory}/Documents";
  #   #   sandboxAllowedPaths = [
  #   #     "${config.home.homeDirectory}/.config/git/"
  #   #     "/nix/store/"
  #   #   ];
  #   # };
}

# Previous settings.json
# {
#     "files.dialog.defaultPath": "/Users/kstone/Documents",
#     "git.blame.editorDecoration.enabled": true,
#     "python.languageServer": "Default"
# }⏎
