function cdr

    git rev-parse --git-dir >/dev/null 2>&1; and cd (git rev-parse --show-toplevel); and return
    set -l hg_root (hg root 2>/dev/null); and cd $hg_root; and return
    return 255
end
