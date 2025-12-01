{ lib, pkgs, ... }: {

  home.sessionVariables.WORKON_BASE_DIR =
    lib.mkIf pkgs.stdenv.isDarwin "$HOME/Documents";

  programs.fish.completions.workon = ''
    complete -c workon -xa '(for d in $WORKON_BASE_DIR/*; test -d "$d"; and echo (basename $d); end)'
  '';

  programs.fish.functions.workon.body = ''
  set -q argv[1]
  and set -l path $argv[1]
  or set -l path "."

  set -q WORKON_BASE_DIR; or set
  and set -l base $WORKON_BASE_DIR
  or set -l base $HOME

	# Change this to your base projects path [$base/{project1,project2,...}]

	# Change this to your relative virtual_env dir (if exists) [$base/{project}/$VENV_DIR]
	set VENV_DIR ".venv"

	test -z "$VIRTUAL_ENV"
	or deactivate

	cd $base/$path
  and test -d $VENV_DIR
  and source $VENV_DIR/bin/activate.fish

  true
  '';
}
