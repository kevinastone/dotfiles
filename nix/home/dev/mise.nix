{ ... }:
{
  programs.mise = {
    enable = true;

    globalConfig = {
      settings = {
        # disable warning about */.node-version files
        idiomatic_version_file_enable_tools = [ ];
        python = {
          uv_venv_auto = true;
        };
      };
      tools = {
        node = {
          version = "lts";
          postinstall = "corepack enable";
        };
        rust = "stable";
        python = "latest";
        uv = "latest";
      };
    };

    settings = {
      verbose = false;
      auto_install = true;
    };
  };
}
