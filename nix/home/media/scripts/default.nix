{ pkgs, ... }:
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
  home.packages = with pkgs; [
    (mkShellApplication {
      script = ./title-rename.sh;
      runtimeInputs = [ ffmpeg ];
    })
    (mkShellApplication {
      script = ./prefix-rename.sh;
      runtimeInputs = [ rename ];
    })
  ];
}
