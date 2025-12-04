{
  lib,
  config,
  ...
}:

let
  inherit (lib)
    literalExpression
    mkOption
    types
    ;
  inherit (config.home) profileDirectory;
  cfg = config.sudo.nopasswd;
  getExecutable = item: if lib.isString item then item else item.meta.mainProgram;
in
{
  options.sudo.nopasswd.executables = mkOption {
    type = with types; listOf (either str package);
    default = [ ];
    example = literalExpression ''
      [
        pkgs.htop
        "reboot"
        "shutdown"
        "halt"
        "poweroff"
      ]
    '';
    description = ''
      List of executables to allow to run under sudo without a password
    '';
  };

  options.sudo.nopasswd.paths = mkOption {
    internal = true;
    type = with types; listOf str;
    default = [ ];
  };

  config.sudo.nopasswd.paths = lib.forEach cfg.executables (
    item:
    lib.pipe item [
      getExecutable
      (item: "${profileDirectory}/bin/${item}")
    ]
  );
}
