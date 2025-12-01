{ pkgs, ... }: {
  nix.settings.experimental-features = "nix-command flakes";

  environment.systemPackages = with pkgs; [
    curl
    htop
    tree
    vim
    watch
    wget
  ];

  environment.variables.EDITOR = "vim";
}
