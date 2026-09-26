#!/usr/bin/env nu

# Unnest single video files from subdirectories to the parent directory.
def main [
    target: string = "."        # Target directory to search in (defaults to '.')
    ...ignores: string          # Directory patterns or paths to ignore
    --dry-run (-n)              # Preview changes without moving or deleting
] {
    # 1. Glob and filter video files
    let video_files = (
        glob --no-dir $"($target)/*/*.{mp4,mkv,avi,mov,wmv,flv,webm,m4v}"
        | where { |file|
            let dir_name = $file | path dirname | path basename | str lowercase
            $ignores | all {|pattern| not ($dir_name like ($pattern | str lowercase)) }
        }
    )

    # 2. Find candidate videos (directories containing exactly 1 video file)
    let candidates = (
        $video_files
        | group-by { path dirname }
        | values
        | where { ($in | length) == 1 }
        | flatten
    )

    if ($candidates | is-empty) {
        print "No single video files found to unnest."
        return
    }

    # 3. Prompt user to select which files to move using gum
    let selected_files = (gum-choose $candidates "Select which video files to unnest")

    if ($selected_files | is-empty) {
        print "No files selected. Aborting."
        return
    }

    # 4. Move selected files to parent directory
    print "Moving selected files..."
    let moved_dirs = (
        $selected_files
        | each { |video_file|
            let source_dir = $video_file | path dirname
            let parent_dir = $source_dir | path dirname

            print $"Moving '($video_file | path basename)' to '($parent_dir)'"
            if not $dry_run {
                mv -n $video_file $parent_dir
            }
            $source_dir
        }
        | uniq
    )

    # 5. Prompt user to clean up emptied source directories
    if ($moved_dirs | is-not-empty) {
        let selected_dirs = (gum-choose $moved_dirs "Select which directories to delete")

        if ($selected_dirs | is-not-empty) {
            print "Deleting selected directories..."
            for dir in $selected_dirs {
                print $"Removing '($dir)'"
                if not $dry_run {
                    rm -r $dir
                }
            }
        } else {
            print "No directories selected for deletion."
        }
    }
}

# Helper to interactively choose items via gum
def gum-choose [items: list<string>, header?: string]: nothing -> list<string> {
    let input = $items | to text
    let args = [
        "choose"
        "--no-limit"
        "--selected=*"
    ]
    let args = if ($header | is-not-empty) {
        $args | append $"--header=($header)"
    } else {
        $args
    }

    try {
        $input | ^gum ...$args | lines | compact
    } catch {
        []
    }
}
