#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE' >&2
Usage: $(basename "$0") [-n|--dry-run] [-r|--replace <replacement>] <prefix> [file...]

Removes (or replaces) the specified <prefix> from filenames.

Options:
  -n, --dry-run               Preview changes without renaming
  -r, --replace <replacement> Replace prefix instead of removing it
  -h, --help                  Display this help message

If no files are specified, all files starting with <prefix> in the
current directory will be targeted.
USAGE
  exit 1
}

dry_run=0
replacement=""

while [ "$#" -gt 0 ]; do
  case "$1" in
  -n | --dry-run)
    dry_run=1
    shift
    ;;
  -r | --replace)
    if [ "$#" -lt 2 ]; then
      echo "Error: --replace requires an argument." >&2
      exit 1
    fi
    replacement="$2"
    shift 2
    ;;
  -h | --help)
    usage
    ;;
  --)
    shift
    break
    ;;
  -*)
    echo "Error: Unknown option '$1'" >&2
    usage
    ;;
  *)
    break
    ;;
  esac
done

if [ "$#" -eq 0 ]; then
  usage
fi

prefix="$1"
shift

files=()
if [ "$#" -gt 0 ]; then
  files=("$@")
else
  shopt -s nullglob
  files=("$prefix"*)
  shopt -u nullglob
  if [ "${#files[@]}" -eq 0 ]; then
    echo "Notice: No files found matching prefix '$prefix'." >&2
    exit 0
  fi
fi

rename_flags=(-v)
if [ "$dry_run" -eq 1 ]; then
  rename_flags+=(-n)
fi

rename "${rename_flags[@]}" "s/(^|.*\/)\K\Q${prefix}\E/${replacement}/" "${files[@]}"
