{ self, ... }:
{
  programs.tmux = {
    enable = true;
    # prefix = "C-a";
    extraConfig = builtins.readFile (self + "/tmux.conf");
  };
}
