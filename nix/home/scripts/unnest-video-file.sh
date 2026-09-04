# Target directory to scan (defaults to the current directory if no argument is provided)
TARGET_DIR="${1:-.}"

# Enable nullglob: Unmatched globs expand to nothing rather than the literal string
# Enable nocaseglob: Case-insensitive matching so .MP4 and .mp4 are both caught
shopt -s nullglob nocaseglob

# Temporary array of candidate videos to move
candidates=()

# Find all directories recursively, starting from TARGET_DIR
# -mindepth 1 prevents checking the TARGET_DIR itself
# -print0 safely handles paths with spaces and special characters
while IFS= read -r -d '' dir; do
    # Populate an array with video files found in the current directory
    videos=("$dir"/*.{mp4,mkv,avi,mov,wmv,flv,webm,m4v})

    # Check if the array contains exactly 1 item
    count="${#videos[@]}"
    if [[ "$count" -eq 1 ]]; then
        candidates+=("${videos[0]}")
    fi
done < <(find "$TARGET_DIR" -mindepth 1 -type d -print0)

# Check if we found any candidates
if [[ ${#candidates[@]} -eq 0 ]]; then
    echo "No single video files found to unnest."
    exit 0
fi

# Print instructions for gum
echo "Select which video files to unnest (Space to select/deselect, Enter to confirm):"

# Format candidates for gum choose and default to all selected
selected_files=$(printf "%s\n" "${candidates[@]}" | gum choose --no-limit --selected="*")

# If gum was cancelled (Ctrl+C / Esc) or nothing was selected, exit.
if [[ -z "$selected_files" ]]; then
    echo "No files selected. Aborting."
    exit 0
fi

# Arrays/lists to track successfully moved files' source dirs
moved_dirs=()

# Process the selected files
echo "Moving selected files..."
while IFS= read -r video_file; do
    if [[ -f "$video_file" ]]; then
        dir="$(dirname "$video_file")"
        parent_dir="$(dirname "$dir")"
        echo "Moving '$(basename "$video_file")' to '$parent_dir'"
        if mv "$video_file" "$parent_dir/"; then
            moved_dirs+=("$dir")
        fi
    fi
done <<< "$selected_files"

# Check if any directories are candidates for cleanup
if [[ ${#moved_dirs[@]} -gt 0 ]]; then
    echo ""
    echo "Select which directories to delete (Space to select/deselect, Enter to confirm):"
    
    # Deduplicate and sort directory paths
    IFS=$'\n' read -r -d '' -a unique_dirs < <(printf "%s\n" "${moved_dirs[@]}" | sort -u && printf '\0')
    
    selected_dirs=$(printf "%s\n" "${unique_dirs[@]}" | gum choose --no-limit --selected="*")
    
    if [[ -n "$selected_dirs" ]]; then
        echo "Deleting selected directories..."
        while IFS= read -r dir; do
            if [[ -d "$dir" ]]; then
                echo "Removing '$dir'"
                rm -rf "$dir"
            fi
        done <<< "$selected_dirs"
    else
        echo "No directories selected for deletion."
    fi
fi
