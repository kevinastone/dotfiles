
function prbt --description "Post Pull-Request to Review Board"

	set -l BRANCH $argv[1]
	set -q argv[2..-1]
	and set argv $argv[2..-1]
	or set argv

	set -l BASE (git merge-base $BRANCH origin/master)
	set -l HEAD (git rev-parse $BRANCH)

	rbt post --revision-range $BASE:$HEAD $argv
end
