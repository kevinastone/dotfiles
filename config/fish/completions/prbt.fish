set PR_PREFIX "origin/pr/"

complete -c prbt -fAa '(git branch -r | grep "$PR_PREFIX" | tr -d " ")'
