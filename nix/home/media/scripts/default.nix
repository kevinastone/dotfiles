{ pkgs, ... }:
let
  writeNuBin =
    {
      name ? pkgs.lib.removeSuffix ".nu" (baseNameOf script),
      script,
      runtimeInputs ? [ ],
    }:
    let
      writer = pkgs.writers.makeScriptWriter (
        {
          interpreter = "${pkgs.nushell}/bin/nu";
        }
        // (pkgs.lib.optionalAttrs (runtimeInputs != [ ]) {
          makeWrapperArgs = [
            "--prefix"
            "PATH"
            ":"
            (pkgs.lib.makeBinPath runtimeInputs)
          ];
        })
      );
    in
    writer "/bin/${name}" (builtins.readFile script);
in
{
  home.packages = with pkgs; [
    (writeNuBin {
      script = ./title-rename.nu;
      runtimeInputs = [ ffmpeg ];
    })
    (writeNuBin {
      script = ./prefix-rename.nu;
    })
    (writeShellApplication {
      name = "unnest-video-file";
      runtimeInputs = [
        zx
        (writeNuBin {
          name = "unnest-video-file-nu";
          script = ./unnest-video-file.nu;
          runtimeInputs = [ gum ];
        })
      ];
      text = ''
        exec zx ${./unnest-video-file.mts} "$@"
      '';
    })
  ];
}
