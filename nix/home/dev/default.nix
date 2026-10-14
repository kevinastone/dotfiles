{ pkgs, ... }:
{
  imports = [
    # keep-sorted start
    ./antigravity
    ./colima.nix
    ./container.nix
    ./docker.nix
    ./fonts.nix
    ./javascript
    # ./mise.nix
    ./neovim.nix
    ./nix.nix
    ./python
    # keep-sorted end
  ];

  home.packages = with pkgs; [
    # keep-sorted start
    cyberduck
    duckdb
    just
    # keep-sorted end
  ];
}
