{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nix-homebrew, home-manager, nixpkgs }:
    let
      username = "kstone";
    in {
    darwinConfigurations."M1Max" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit inputs;
        inherit username;
      };
      modules = [
        ./nix
        ./nix/darwin
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # User owning the Homebrew prefix
            user = username;

            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager
        {
          # home-manager.verbose = true;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./nix/home;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            inherit username;
          };
        }
      ];
    };
  };
}
