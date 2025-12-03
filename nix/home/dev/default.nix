{ ... }:
{
  imports = [
    # ./colima.nix
    ./docker.nix
    ./duckdb.nix
    ./javascript
    ./mise.nix
    ./nix.nix
    ./python
  ];
}
