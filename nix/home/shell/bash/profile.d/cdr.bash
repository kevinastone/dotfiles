#/bin/bash
function cdr() {

    git rev-parse --git-dir > /dev/null 2>&1 && {
        cd $(git rev-parse --show-toplevel);
        return;
    }

    hg_root=$(hg root 2>/dev/null) && {
        cd "$hg_root";
        return;
    }

    return 255
}
