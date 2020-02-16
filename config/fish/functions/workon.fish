set -q WORKON_BASE_DIR
or set -x WORKON_BASE_DIR "$HOME"

function workon

    set -q argv[1]
    and set -l path $argv[1]
    or set -l path "."

	# Change this to your base projects path [$WORKON_BASE_DIR/{project1,project2,...}]

	# Change this to your relative virtual_env dir (if exists) [$WORKON_BASE_DIR/{project}/$VENV_DIR]
	set VENV_DIR ".venv"

	test -z "$VIRTUAL_ENV"
	or deactivate

    cd $WORKON_BASE_DIR/$path
    and test -d $VENV_DIR
    and source $VENV_DIR/bin/activate.fish

    true
end
