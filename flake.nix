{
  description = "My nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    catppuccin.url = "github:catppuccin/nix";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    file-associations.url = "path:./nix/flakes/file-associations";
    sudo-nopasswd.url = "path:./nix/flakes/sudo-nopasswd";
  };

  outputs =
    {
      self,
      nix-darwin,
      nix-homebrew,
      catppuccin,
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
          home-modules ? [ ],
          ...
        }@args:
        let
          inherit (nixpkgs) lib;
          darwinSystem =
            nix-darwin.lib.darwinSystem {
              specialArgs = {
                inherit rootPath;
                inherit nix-homebrew;
                inherit username;
              };
              modules =
                modules
                ++ [
                  ./nix
                ]
                ++ [
                  sudo-nopasswd.darwinModules.sudo-nopasswd
                ]
                ++ lib.optionals (home-modules != [ ]) [
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
                      inherit rootPath;
                      inherit catppuccin;
                    };
                    home-manager.users.${username} = {
                      imports = [
                        ./nix/home
                      ]
                      ++ home-modules;
                    };
                  }
                ];
            }
            // (builtins.removeAttrs args [
              "username"
              "modules"
              "home-modules"
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
          ./nix/darwin
          ./nix/darwin/system
          ./nix/darwin/shell/fish.nix
          ./nix/darwin/homebrew
          ./nix/darwin/homebrew/transmission.nix
        ];
        home-modules = [
          # keep-sorted start
          ./nix/home/admin
          ./nix/home/catppuccin.nix
          ./nix/home/chrome.nix
          ./nix/home/dev
          ./nix/home/ghostty
          ./nix/home/hammerspoon.nix
          ./nix/home/icloud.nix
          ./nix/home/media
          ./nix/home/scripts
          ./nix/home/x
          ./nix/home/xfce4
          ./nix/home/zed
          # keep-sorted end
        ];
      };
    };
}
