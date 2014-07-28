
# Change this to your base projects path [$WORKON_BASE_DIR/{project1,project2,...}]
WORKON_BASE_DIR=${WORKON_BASE_DIR:-"/mnt/hgfs"}

# Change this to your relative virtual_env dir (if exists) [$WORKON_BASE_DIR/{project}/$VENV_DIR]
VENV_DIR=".env"

function workon() {

    [ -z "$VIRTUAL_ENV" ] || deactivate
    cd $WORKON_BASE_DIR/$1 &&
    [ -d $VENV_DIR ] && source $VENV_DIR/bin/activate
}

_workon() {
	
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	words=("${COMP_WORDS[@]}")
	
	[ $COMP_CWORD -gt 1 ] && return 0
	
	# COMPREPLY=( $(compgen -d -- ${cur}) )
	COMPREPLY=( $(compgen -W "$(for d in $WORKON_BASE_DIR/${cur}*; do [[ -d "$d" ]] && echo `basename $d`; done)" -- ${cur}) )
	return 0
}

complete -F _workon workon
