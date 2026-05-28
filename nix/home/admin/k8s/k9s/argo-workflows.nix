{ pkgs, ... }:
let
  mkArgoWorkflowPlugin =
    {
      args,
      shortCut,
      scopes ? [ "workflows" ],
      ...
    }@params:
    {
      inherit shortCut;
      inherit scopes;
      command = "sh";
      background = false;
      inherit args;
    }
    // (removeAttrs params [
      "args"
      "shortCut"
      "scopes"
    ]);
in
{
  programs.k9s.plugins = {
    view-workflow = mkArgoWorkflowPlugin {
      shortCut = "v";
      description = "watch";
      args = [
        "-c"
        ''
          argo -n $NAMESPACE get $NAME
          echo -n "\nPress enter to return to k9s..." && read _
        ''
      ];
    };
    watch-workflow = mkArgoWorkflowPlugin {
      shortCut = "Shift-W";
      description = "watch";
      args = [
        "-c"
        ''
          hwatch -n 3 -c argo -n $NAMESPACE get $NAME
        ''
      ];
    };
    terminate-workflow = {
      shortCut = "t";
      confirm = true;
      description = "terminate";
      command = "argo";
      background = false;
      scopes = [ "workflows" ];
      args = [
        "-n"
        "$NAMESPACE"
        "terminate"
        "$NAME"
      ];
    };
  };

  home.packages = with pkgs; [
    argo-workflows
    hwatch
  ];
}
