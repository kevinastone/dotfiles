{ ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/dotfiles";
    };
  };
}
