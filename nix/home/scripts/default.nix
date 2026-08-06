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
      (mkShellApplication {
        script = ./unnest-video-file.sh;
        runtimeInputs = [
          coreutils
          findutils
        ];
      })
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      (mkShellApplication {
        script = ./fix-calendar.sh;
      })
    ];
}
