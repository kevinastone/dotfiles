{
  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user = {
      email = "kevinastone@gmail.com";
      name = "Kevin Stone";
    };
    revsets = {
      bookmark-advance-to = "heads(::@ & ~empty())";
    };
    aliases = {
      tug = [
        "bookmark"
        "advance"
      ];
    };
  };

  programs.jjui.enable = true;
}
