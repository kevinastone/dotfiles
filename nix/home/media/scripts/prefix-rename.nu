#!/usr/bin/env nu

# Removes (or replaces) the specified prefix from filenames.
#
# If no files are specified, all files starting with <prefix> in the
# current directory will be targeted.
def main [
  prefix: string                 # Prefix to match and remove/replace
  ...files: string               # Target files (defaults to `<prefix>*`)
  --dry-run (-n)                 # Preview changes without renaming
  --replace (-r): string = ""    # Replacement string instead of removing prefix
] {
    let targets = if ($files | is-not-empty) {
        $files
    } else {
        glob $"($prefix)*"
    }

    if ($targets | is-empty) {
        print -e $"Notice: No files found matching prefix '($prefix)'."
        return
    }

    for file in $targets {
        let parent = $file | path dirname
        let filename = $file | path basename

        if ($filename | str starts-with $prefix) {
            let new_filename = $filename | str replace $prefix $replace
            let new_path = if $parent == "." {
                $new_filename
            } else {
                $parent | path join $new_filename
            }

            if $file == $new_path {
                continue
            }

            if not $dry_run {
                mv $file $new_path
            }
            print $"($file) -> ($new_path)"
        }
    }
}
