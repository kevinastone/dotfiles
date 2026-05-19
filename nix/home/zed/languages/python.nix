{ pkgs, ... }:
{
  programs.zed-editor = {
    extraPackages = with pkgs; [
      python3
    ];

    extensions = [
      "ruff"
    ];

    userSettings = {
      languages.Python = {
        language_servers = [
          "pyright"
          "ruff"
        ];
        format_on_save = "on";
        formatter = [
          {
            code_action = "source.organizeImports.ruff";
          }
          {
            code_action = "source.fixAll.ruff";
          }
          {
            language_server.name = "ruff";
          }
        ];
      };

      lsp.ruff.initialization_options.settings.lint.extendSelect = [ "I" ];
    };
  };
}
