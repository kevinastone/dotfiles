function graphviz
    
    set -l filename $argv[1]
    set -q argv[2..-1]
    and set -l renderer $argv[2]
    or set -l renderer pdf

    dot -T$renderer $filename | open -f -a /Applications/Preview.app
end
