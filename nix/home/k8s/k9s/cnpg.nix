{ pkgs, ... }: {
  programs.k9s.plugins.cnpg-logs = {
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
}
