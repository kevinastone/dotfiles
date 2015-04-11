function __fish_arc_needs_command
    set cmd (commandline -opc)
        if [ (count $cmd) -eq 1 -a $cmd[1] = 'arc' ]
            return 0
        end
    return 1
end

function __fish_arc_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

function __fish_arc_findup
    set -l dir "$PWD"
    set -l filename $argv[1]
    while [ "$dir" != "/" ]
        set -l path "$dir"/"$filename"
        if [ -e $path ]
            echo "$path"
            break
        end
        set -l dir (dirname "$dir")
    end
end

function __fish_arc_get_current_project
    set -l config_file (__fish_arc_findup .arcconfig)
    [ -z "$config_file" ]; and return 0
    python -c "import json; print(json.load(file('$config_file'))['project.name'])"
end

function __fish_arc_get_open_differential_revisions
    set -l author (echo '{}' | arc call-conduit user.whoami | python -c "import json, sys; print(json.loads(sys.stdin.read())['response']['phid'])")
    echo '{"status": "status-open", "authors": ["$author"], "arcanistProjects": ["(__fish_arc_get_current_project)"]}' | arc call-conduit differential.query 2>/dev/null | python -c "import json, sys; print(' '.join('D{id}'.format(id=diff['id']) for diff in json.loads(sys.stdin.read())['response'] or []))"
end

complete -c arc -n 'not __fish_arc_needs_command' -l help -f -d 'Display the manual of an arc command'

complete -c arc -n '__fish_arc_needs_command' -A -x -a (command arc shell-complete)

# arc diff
complete -c arc -n '__fish_arc_using_command diff' -l update -x -a '(__fish_arc_get_open_differential_revisions)' --description 'Revision'
complete -c arc -n '__fish_arc_using_command diff' -l preview -f --description 'Preview this revision'
complete -c arc -n '__fish_arc_using_command diff' -l create -f --description 'Always create a new revision'
complete -c arc -n '__fish_arc_using_command diff' -s m -l message -x --description 'Use the specified message'
complete -c arc -n '__fish_arc_using_command diff' -l reviews -x --description 'Specify reviewers'
complete -c arc -n '__fish_arc_using_command diff' -l cc -x --description 'Specify CCs'
