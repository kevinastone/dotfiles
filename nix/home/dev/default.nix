{ pkgs, ... }:
{
  imports = [
    # keep-sorted start
    ./colima.nix
    ./docker.nix
    ./fonts.nix
    ./javascript
    ./mise.nix
    ./neovim.nix
    ./nix.nix
    ./python
    # keep-sorted end
  ];

  home.packages = with pkgs; [
    # keep-sorted start
    duckdb
    just
    # keep-sorted end
  ];
}
