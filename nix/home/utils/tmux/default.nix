{ self, ... }:
{

  programs.tmux = {
    enable = true;
    # prefix = "C-a";
  };

  home.file = {
    ".tmux.conf".source = self + "/tmux.conf";
  };
}
