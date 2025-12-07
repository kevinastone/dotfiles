_: {
  system.defaults.CustomUserPreferences."com.apple.Terminal" = {
    NewTabWorkingDirectoryBehavior = true;
    "Default Window Settings" = "Default";
    "Startup Window Settings" = "Default";

    "Window Settings".Default = {
      name = "Default";
      type = "Window Settings";
      FontAntialias = 1;
      useOptionAsMetaKey = true;
      shellExitAction = 1;
      # noWarnProcesses = mkNoWarnProcesses [
      #   "screen"
      #   "tmux"
      #   "ssh"
      #   "mosh-client"
      #   "bash"
      # ];
    };
  };
}
