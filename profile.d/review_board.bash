PULL_REQUEST_REF="origin/pr/"

function prbt() {

	BRANCH=$1
	shift

	BASE=`git merge-base $BRANCH origin/master`
	HEAD=`git rev-parse $BRANCH`

	rbt post --revision-range $BASE:$HEAD $*
}


_pull_requests() {

	local cur
	cur="${COMP_WORDS[COMP_CWORD]}"
	if [[ "$cur" != ${PULL_REQUEST_REF}* ]]; then
		cur="${PULL_REQUEST_REF}"
	fi

	[ $COMP_CWORD -gt 1 ] && return 0

	COMPREPLY=( $(compgen -W "$(git branch -r | grep $cur)"))
	return 0
}

complete -F _pull_requests prbt
