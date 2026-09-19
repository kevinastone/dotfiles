# Parse command-line arguments
TARGET_DIR=""
IGNORE_DIRS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
  -i | --ignore)
    if [[ -n $2 && $2 != -* ]]; then
      IGNORE_DIRS+=("$2")
      shift 2
    else
      echo "Error: $1 requires a path argument." >&2
      exit 1
    fi
    ;;
  --ignore=*)
    IGNORE_DIRS+=("${1#*=}")
    shift
    ;;
  -*)
    echo "Error: Unknown option: $1" >&2
    exit 1
    ;;
  *)
    if [[ -z $TARGET_DIR ]]; then
      TARGET_DIR="$1"
    else
      echo "Error: Multiple target directories specified: '$TARGET_DIR' and '$1'" >&2
      exit 1
    fi
    shift
    ;;
  esac
done

# Default target directory to the current directory if no argument is provided
TARGET_DIR="${TARGET_DIR:-.}"

# Enable nullglob: Unmatched globs expand to nothing rather than the literal string
# Enable nocaseglob: Case-insensitive matching so .MP4 and .mp4 are both caught
shopt -s nullglob nocaseglob

# Temporary array of candidate videos to move
candidates=()

# Build find command arguments with prune filters for ignored directories
find_cmd=(find "$TARGET_DIR" -mindepth 1)

if [[ ${#IGNORE_DIRS[@]} -gt 0 ]]; then
  ignore_expr=()
  for ignore_dir in "${IGNORE_DIRS[@]}"; do
    # Strip trailing slashes
    trimmed_dir="${ignore_dir%/}"
    [[ -z $trimmed_dir ]] && continue

    if [[ ${#ignore_expr[@]} -gt 0 ]]; then
      ignore_expr+=(-o)
    fi

    if [[ $trimmed_dir == /* ]]; then
      # Absolute path specified
      ignore_expr+=(-path "$trimmed_dir" -o -path "$trimmed_dir/*")
    elif [[ $trimmed_dir == */* ]]; then
      # Relative path with subdirectory components (e.g. sub/Keep)
      # Match relative to TARGET_DIR as well as any suffix path
      target_rel="${TARGET_DIR%/}/$trimmed_dir"
      ignore_expr+=(-path "$target_rel" -o -path "$target_rel/*" -o -path "*/$trimmed_dir" -o -path "*/$trimmed_dir/*")
    else
      # Simple directory name (e.g. Keep)
      target_rel="${TARGET_DIR%/}/$trimmed_dir"
      ignore_expr+=(-name "$trimmed_dir" -o -path "$target_rel" -o -path "$target_rel/*")
    fi
  done
  find_cmd+=(\( "${ignore_expr[@]}" \) -prune -o)
fi

find_cmd+=(-type d -print0)

# Find all directories recursively, starting from TARGET_DIR
# -mindepth 1 prevents checking the TARGET_DIR itself
# -print0 safely handles paths with spaces and special characters
while IFS= read -r -d '' dir; do
  # Populate an array with video files found in the current directory
  videos=("$dir"/*.{mp4,mkv,avi,mov,wmv,flv,webm,m4v})

  # Check if the array contains exactly 1 item
  count="${#videos[@]}"
  if [[ $count -eq 1 ]]; then
    candidates+=("${videos[0]}")
  fi
done < <("${find_cmd[@]}")

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
if [[ -z $selected_files ]]; then
  echo "No files selected. Aborting."
  exit 0
fi

# Arrays/lists to track successfully moved files' source dirs
moved_dirs=()

# Process the selected files
echo "Moving selected files..."
while IFS= read -r video_file; do
  if [[ -f $video_file ]]; then
    dir="$(dirname "$video_file")"
    parent_dir="$(dirname "$dir")"
    echo "Moving '$(basename "$video_file")' to '$parent_dir'"
    if mv "$video_file" "$parent_dir/"; then
      moved_dirs+=("$dir")
    fi
  fi
done <<<"$selected_files"

# Check if any directories are candidates for cleanup
if [[ ${#moved_dirs[@]} -gt 0 ]]; then
  echo ""
  echo "Select which directories to delete (Space to select/deselect, Enter to confirm):"

  # Deduplicate and sort directory paths
  IFS=$'\n' read -r -d '' -a unique_dirs < <(printf "%s\n" "${moved_dirs[@]}" | sort -u && printf '\0')

  selected_dirs=$(printf "%s\n" "${unique_dirs[@]}" | gum choose --no-limit --selected="*")

  if [[ -n $selected_dirs ]]; then
    echo "Deleting selected directories..."
    while IFS= read -r dir; do
      if [[ -d $dir ]]; then
        echo "Removing '$dir'"
        rm -rf "$dir"
      fi
    done <<<"$selected_dirs"
  else
    echo "No directories selected for deletion."
  fi
fi
