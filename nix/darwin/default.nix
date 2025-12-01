{ pkgs, ... }: {
  imports = [
    ./homebrew.nix
    ./system
  ];

  environment.systemPackages = with pkgs; [
    htop
    tmux
    tree
    watch
    wget
  ];
}
