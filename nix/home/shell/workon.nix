{ lib, pkgs, ... }:
{

  home.sessionVariables.WORKON_BASE_DIR = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin "$HOME/Documents";

  programs.fish.completions.workon = ''
    complete -c workon -xa '(for d in $WORKON_BASE_DIR/*; test -d "$d"; and echo (basename $d); end)'
  '';

  programs.fish.functions.workon.body = ''
    set -l path "."
    if set -q argv[1]
      set path $argv[1]
    end

    set -l base $HOME
    if set -q WORKON_BASE_DIR
      set base $WORKON_BASE_DIR
    end

    # Change this to your relative virtual_env dir (if exists) [$base/{project}/$VENV_DIR]
    set -l VENV_DIR ".venv"

    if set -q VIRTUAL_ENV; and test -n "$VIRTUAL_ENV"
      deactivate
    end

    cd $base/$path
    and test -d $VENV_DIR
    and source $VENV_DIR/bin/activate.fish

    true
  '';
}
