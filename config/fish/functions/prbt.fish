
function prbt --description "Post Pull-Request to Review Board"

	set -l BRANCH $argv[1]
	set -q argv[2..-1]
	and set argv $argv[2..-1]
	or set argv

    rbt post --branch=$BRANCH --tracking-branch=origin/master $argv
end
