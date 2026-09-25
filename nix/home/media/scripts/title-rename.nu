#!/usr/bin/env nu

# Renames media files based on their title metadata extracted with ffprobe.
def main [
  ...files: string # Files to rename based on title metadata
  --dry-run (-n)   # Preview changes without renaming
] {
    for f in $files {
        if (try { ($f | path type) != "file" } catch { true }) {
            print -e $"Warning: '($f)' is not a regular file, skipping."
            continue
        }

        # Extract and sanitize title metadata
        let title = (try {
      ^ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 $f
    } catch {
      ""
    }
      | str replace --all '[\/\\]' "-"
      | str trim
    )

        if ($title | is-empty) {
            print -e $"Notice: No valid title found in metadata for '($f)', skipping."
            continue
        }

        let target = (
            $f
            | path parse
            | update stem $title
            | path join
        )

        if $f == $target {
            print $"Notice: '($f)' is already named '($target | path basename)'."
            continue
        }

        if ($target | path exists) {
            print -e $"Warning: Target '($target)' already exists, skipping."
            continue
        }

        if not $dry_run {
            mv $f $target
        }
        print $"($f | path basename) -> ($target | path basename)"
    }
}
