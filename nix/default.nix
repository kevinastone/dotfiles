{ pkgs, ... }: {
  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.config = {
      allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    curl
    htop
    pstree
    tree
    vim
    watch
    wget
  ];

  environment.variables.EDITOR = "vim";
}
