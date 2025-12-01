
function pullall --description "Git Pull all Repos under the current path"
    set -q argv[1]
    and set -l path $argv[1]
    or set -l path $PWD
    
    for git_dir in (find "$path" -name .git -type d -prune)
        pushd $git_dir/..
        set_color blue
        echo $PWD
        set_color normal
        git pull --rebase -p
        popd
    end
end
