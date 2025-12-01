function pblockdiag
    
    set -l filename $argv[1]
    set -q argv[2..-1]
    and set -l renderer $argv[2]
    or set -l renderer svg

    set -l output (mktemp -t diag)
    mv "$output" "$output.$renderer"
    set -l output "$output.$renderer"
    blockdiag -T$renderer $filename -o $output
    open -a /Applications/Safari.app $output
end
