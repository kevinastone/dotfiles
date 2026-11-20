{
  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user = {
      email = "kevinastone@gmail.com";
      name = "Kevin Stone";
    };
    templates.log = "builtin_log_comfortable";
    revsets = {
      log = "present(@) | ancestors(trunk()..@, 2) | trunk()";
      bookmark-advance-to = "heads(::@ & ~empty())";
    };
    aliases = {
      tug = [
        "bookmark"
        "advance"
      ];
      history = [
        "log"
        "-r"
        "::@"
        "-T"
        "builtin_log_detailed"
      ];
      hist = [ "history" ];
    };
    ui.default-command = "log";
  };

  programs.jjui.enable = true;
}
