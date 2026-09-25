{ pkgs, ... }:
let
  writeNuBin =
    {
      script,
      runtimeInputs ? [ ],
    }:
    let
      name = pkgs.lib.removeSuffix ".nu" (baseNameOf script);
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
  home.packages = [
    (writeNuBin {
      script = ./title-rename.nu;
      runtimeInputs = [ pkgs.ffmpeg ];
    })
    (writeNuBin {
      script = ./prefix-rename.nu;
    })
  ];
}
