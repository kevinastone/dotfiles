function arc --description "command line client to the phabricator review system"

    set -l subcommand $argv[1]
    set -q argv[2..-1]
    and set argv $argv[2..-1]
    or set argv

    if contains -- "--help" $argv
        # don't force any options
    else if set -q $subcommand
        # If we don't have a subcommand...
    else
        switch $subcommand
            case amend
                if not contains -- "--show" $argv
                    set argv "--show" $argv
                end

            case diff
                if not contains -- "--browse" $argv
                    set argv "--browse" $argv
                end
                if not contains -- "--allow-untracked" $argv
                    set argv "--allow-untracked" $argv
                end

            case land
                if not contains -- "--onto" $argv
                    set argv "--onto" "master" $argv
                end
                if not contains -- "--hold" $argv
                    set argv "--hold" $argv
                end
                if not contains -- "--keep-branch" $argv
                    set argv "--keep-branch" $argv
                end

            case patch
                if not contains -- "--nocommit" $argv
                    set argv "--nocommit" $argv
                end
                if not contains -- "--nobranch" $argv
                    set argv "--nobranch" $argv
                end
        end
    end
    echo "arc $subcommand $argv" >&2
    command arc $subcommand $argv
end
