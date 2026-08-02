_: {
  imports = [
    # ./git-hook.nix
  ];

  programs.antigravity-cli.enable = true;
  # Use homebrew to get antigravity-2.0 until nixpkgs/home-manager sorts it out
  homebrew.casks = [ "antigravity" ];
}
