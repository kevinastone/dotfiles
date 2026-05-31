{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    antigravity-cli
  ];

  programs.antigravity = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # keep-sorted start
      astro-build.astro-vscode
      biomejs.biome
      bradlc.vscode-tailwindcss
      charliermarsh.ruff
      github.vscode-github-actions
      golang.go
      hashicorp.hcl # TODO: Replace with "opentofu.vscode-opentofu" when available
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      # "meta.pyrefly"
      ms-pyright.pyright
      ms-python.python
      ms-python.vscode-python-envs
      # "ms-vscode.sublime-keybindings"
      # redhat-java
      rust-lang.rust-analyzer
      shopify.ruby-lsp
      # keep-sorted end
    ];
  };
  home.file.".gemini/antigravity-cli/settings.json".text = lib.toJSON {
    enableTelemetry = false;
    enableTerminalSandbox = true;
  };
}

# Previous settings.json
# {
#     "files.dialog.defaultPath": "/Users/kstone/Documents",
#     "git.blame.editorDecoration.enabled": true,
#     "python.languageServer": "Default"
# }⏎
