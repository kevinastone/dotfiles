set PR_PREFIX "origin/pr/"

complete -c prbt -fa '(git branch -r | grep "$PR_PREFIX" | tr -d " ")'
