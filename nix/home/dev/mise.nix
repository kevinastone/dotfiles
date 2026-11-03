{ config, ... }: {
  programs.mise = {
    enable = true;
    enableFishIntegration = true;

    globalConfig = {
      settings = {
        # Don't activate mise unless there's a local .mise.toml
        idiomatic_version_file_enable_tools = [ ];
        ceiling_paths = [ config.home.homeDirectory ];
        verbose = false;
      };
    };
  };
}
