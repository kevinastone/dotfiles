{ pkgs, username, ... }:
{
  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;
  environment.shells = [
    pkgs.fish
  ];

  # Declare the user that will be running `nix-darwin`.
  users.users.${username} = {
    shell = pkgs.fish;
  };
}
