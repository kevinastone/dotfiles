# Target directory to scan (defaults to the current directory if no argument is provided)
TARGET_DIR="${1:-.}"

# Enable nullglob: Unmatched globs expand to nothing rather than the literal string
# Enable nocaseglob: Case-insensitive matching so .MP4 and .mp4 are both caught
shopt -s nullglob nocaseglob

# Find all directories recursively, starting from TARGET_DIR
# -mindepth 1 prevents checking the TARGET_DIR itself
# -print0 safely handles paths with spaces and special characters
find "$TARGET_DIR" -mindepth 1 -type d -print0 | while IFS= read -r -d '' dir; do

    # Populate an array with video files found in the current directory
    # Add or remove extensions inside the braces as needed
    videos=("$dir"/*.{mp4,mkv,avi,mov,wmv,flv,webm,m4v})

    # Check if the array contains exactly 1 item
    count="${#videos[@]}"
    if [[ "$count" -eq 1 ]]; then
        video_file="${videos[0]}"

        # Get the parent directory of the current folder
        parent_dir="$(dirname "$dir")"

        echo "Found single video in: $dir"
        echo "Moving '$(basename "$video_file")' to '$parent_dir'"

        # Move the file to the parent directory
        mv "$video_file" "$parent_dir/"
    else
        echo "Error: Found ${count} video files in '$dir' (Skipping)" >&2
    fi
done
