#!/usr/bin/env nu

def strip-prefix [prefix: string, --replace(-r): string = ""]: string -> string {
    if ($in | str starts-with $prefix) {
        $"($replace)($in | str substring ($prefix | str length)..)"
    } else {
        $in
    }
}

# Removes (or replaces) the specified prefix from filenames.
#
# If no files are specified, all files starting with <prefix> in the
# current directory will be targeted.
def main [
    prefix: string              # Prefix to match and remove/replace
    ...files: string            # Target files (defaults to `<prefix>*`)
    --dry-run (-n)              # Preview changes without renaming
    --replace (-r): string = "" # Replacement string instead of removing prefix
] {
    let targets = if ($files | is-not-empty) {
        $files
    } else {
        glob $"($prefix)*"
    }

    for file in $targets {
        let filename = $file | path basename

        let new_filename = $filename | strip-prefix $prefix --replace $replace
        if $new_filename == $filename {
            continue
        }

        let new_path = (
            $file
            | path parse
            | update basename $new_filename
            | path join
        )

        if not $dry_run {
            mv $file $new_path
        }
        print $"($filename) -> ($new_filename)"
    }
}
