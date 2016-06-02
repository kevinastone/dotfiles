set -q WORKON_BASE_DIR
or set -x WORKON_BASE_DIR "$HOME"

function workon
	# Change this to your base projects path [$WORKON_BASE_DIR/{project1,project2,...}]

	# Change this to your relative virtual_env dir (if exists) [$WORKON_BASE_DIR/{project}/$VENV_DIR]
	set VENV_DIR ".env"

	test -z "$VIRTUAL_ENV"
	or deactivate

    cd $WORKON_BASE_DIR/$argv[1]
    and test -d $VENV_DIR
    and source $VENV_DIR/bin/activate.fish
end
