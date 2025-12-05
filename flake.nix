{
  description = "My nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    file-associations.url = "path:./nix/flakes/file-associations";
    sudo-nopasswd.url = "path:./nix/flakes/sudo-nopasswd";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nix-homebrew,
      home-manager,
      nixpkgs,
      systems,
      treefmt-nix,
      file-associations,
      sudo-nopasswd,
    }:
    let
      rootPath = path: ./. + "/${path}";

      # Small tool to iterate over each systems
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      # Eval the treefmt modules from ./treefmt.nix
      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);

      mkDarwinSystem =
        {
          username ? "kstone",
          modules ? [ ],
          home ? null,
          ...
        }@args:
        let
          inherit (nixpkgs) lib;
          darwinSystem =
            nix-darwin.lib.darwinSystem {
              specialArgs = {
                inherit inputs;
                inherit rootPath;
                inherit nix-homebrew;
                inherit username;
              };
              modules =
                modules
                ++ [
                  sudo-nopasswd.darwinModules.sudo-nopasswd
                ]
                ++ lib.optionals (home != null) [
                  home-manager.darwinModules.home-manager
                  {
                    # home-manager.verbose = true;
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.sharedModules = [
                      file-associations.homeManagerModules.default
                      sudo-nopasswd.homeManagerModules.sudo-nopasswd
                    ];
                    home-manager.extraSpecialArgs = {
                      inherit inputs;
                      inherit rootPath;
                    };
                    home-manager.users.${username} = home;
                  }
                ];
            }
            // (builtins.removeAttrs args [
              "username"
              "modules"
              "home"
            ]);
        in
        darwinSystem;
    in
    {
      # for `nix fmt`
      formatter = eachSystem (pkgs: treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.wrapper);
      # for `nix flake check`
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.check self;
      });

      darwinConfigurations."M1Max" = mkDarwinSystem {
        modules = [
          ./nix
          ./nix/darwin
          ./nix/darwin/homebrew.nix
        ];
        home = import ./nix/home;
      };
    };
}
