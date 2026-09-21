#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -eq 0 ]; then
  echo "Usage: $(basename "$0") <file> [file...]" >&2
  exit 1
fi

for file in "$@"; do
  if [ ! -f "$file" ]; then
    echo "Warning: '$file' is not a regular file, skipping." >&2
    continue
  fi

  # Extract title metadata using ffprobe
  title="$(ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 "$file" 2>/dev/null || true)"

  if [ -z "$title" ]; then
    echo "Notice: No title found in metadata for '$file', skipping." >&2
    continue
  fi

  # Sanitize title: trim whitespace and replace slashes/null bytes with underscores or hyphens
  # Replace path separators / and \ to avoid unintended directory navigation
  clean_title="$(echo "$title" | sed 's|[/\]|-|g' | tr -d '\000-\037' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

  if [ -z "$clean_title" ]; then
    echo "Notice: Title in '$file' is empty after sanitizing, skipping." >&2
    continue
  fi

  dir="$(dirname "$file")"
  ext="${file##*.}"

  # Check if the file had an extension
  if [ "$ext" != "$file" ] && [ -n "$ext" ]; then
    new_filename="${clean_title}.${ext}"
  else
    new_filename="${clean_title}"
  fi

  target="${dir}/${new_filename}"

  if [ "$file" = "$target" ]; then
    echo "Notice: '$file' is already named '$new_filename'."
    continue
  fi

  if [ -e "$target" ]; then
    echo "Warning: Target '$target' already exists, skipping." >&2
    continue
  fi

  echo "Renaming '$file' -> '$target'"
  mv "$file" "$target"
done
