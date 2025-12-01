{ config, pkgs, ... }: {

  programs.tmux = {
    enable = true;
    # prefix = "C-a";
  };

  home.file = {
    ".tmux.conf".source = ./tmux.conf;
  };
}
