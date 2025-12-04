{ lib, pkgs, ... }:
let
  mkShellApplication =
    {
      script,
      ...
    }@args:
    pkgs.writeShellApplication {
      name = builtins.baseNameOf script;
      text = builtins.readFile script;
    }
    // (builtins.removeAttrs args [ "scripts" ]);
in
{
  home.packages =
    with pkgs;
    [
      (mkShellApplication {
        script = ./clear-tmux-idle-shells.sh;
        runtimeInputs = [ tmux ];
      })
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      (mkShellApplication {
        script = ./fix-calendar.sh;
      })
    ];
}
