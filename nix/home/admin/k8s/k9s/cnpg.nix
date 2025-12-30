_:
let
  argsPrefix = "kubectl cnpg --context $CONTEXT -n $NAMESPACE";
  mkCnpgPlugin =
    {
      command,
      shortCut,
      scopes ? [ "cluster" ],
      ...
    }@params:
    {
      inherit shortCut;
      description = "cnpng ${command}";
      inherit scopes;
      command = "bash";
      background = false;
      args = [
        "-c"
        "${argsPrefix} ${command} $NAME | less"
      ];
    }
    // (builtins.removeAttrs params [
      "command"
      "shortCut"
      "scopes"
    ]);
in
{
  programs.k9s.plugins = {
    cnpg-logs = {
      shortCut = "l";
      description = "Logs";
      scopes = [
        "cluster"
      ];
      command = "bash";
      background = false;
      args = [
        "-c"
        "kubectl cnpg logs cluster $NAME -f -n $NAMESPACE --context $CONTEXT"
      ];
    };
    cnpg-status = mkCnpgPlugin {
      shortCut = "Shift-S";
      command = "status";
    };
  };
}
