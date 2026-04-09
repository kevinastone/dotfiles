_: {
  programs.gemini-cli = {
    enable = true;
    settings = {
      ide.enabled = true;
      privacy.usageStatisticsEnabled = false;
      tools.autoAccept = false;
      security.auth.selectedType = "oauth-personal";
    };
  };
}
