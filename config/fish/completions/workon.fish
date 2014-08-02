
complete -c workon -xa '(for d in $WORKON_BASE_DIR/*; test -d "$d"; and echo (basename $d); end)'
