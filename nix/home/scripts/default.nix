{ lib, pkgs, ... }:
let
  mkShellApplication =
    {
      script,
      ...
    }@args:
    pkgs.writeShellApplication (
      {
        name = baseNameOf script;
        text = builtins.readFile script;
      }
      // (removeAttrs args [ "script" ])
    );
in
{
  home.packages =
    with pkgs;
    [
      (mkShellApplication {
        script = ./clear-tmux-idle-shells.sh;
        runtimeInputs = [ tmux ];
      })
      (mkShellApplication {
        script = ./spherical-sbs-metadata.sh;
        runtimeInputs = [ exiftool ];
      })
      (pkgs.writeShellApplication {
        name = "unnest-video-file";
        runtimeInputs = [
          zx
          gum
        ];
        text = ''
          exec zx ${./unnest-video-file.mjs} "$@"
        '';
      })
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      (mkShellApplication {
        script = ./fix-calendar.sh;
      })
    ];
}
