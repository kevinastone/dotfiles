{...}: {
  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      # Don't print a new line at the start of the prompt
      add_newline = false;

      line_break.disabled = true;

      git_branch = {
        symbol = "🌱 ";
        # symbol = "\uE0A0 ";
      };

      package.disabled = true;

      battery = {
        empty_symbol = "🪫";
        discharging_symbol = "🪫";
      };
    };
  };
}
