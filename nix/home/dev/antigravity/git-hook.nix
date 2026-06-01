{ config, pkgs, ... }:
let
  git = config.programs.git.package;
in
{
  programs.git.hooks.prepare-commit-msg = pkgs.writeShellScript "prepare-commit-msg" ''
    COMMIT_MSG_FILE=$1
    COMMIT_SOURCE=$2

    # Only run if a message wasn't already provided via git commit -m, -F, or an amend
    if [ -z "$COMMIT_SOURCE" ]; then
      # Exit early if there are no staged changes to read
      if ${git}/bin/git diff --cached --quiet; then
        exit 0
      fi

      # Ensure agy is available in the path, otherwise fail gracefully to standard empty commit
      if ! command -v agy &> /dev/null; then
        echo "Warning: 'agy' CLI tool not found in PATH. Skipping auto-generated commit message."
        exit 0
      fi

      echo "Antigravity CLI is drafting your commit message..."

      # Pipe the cached diff cleanly into agy's one-shot pipeline
      ${git}/bin/git diff --cached | agy -p \
        "Review this git diff and draft a concise conventional commit message. Respond with ONLY the commit message body. Do not wrap the output in markdown code blocks or quotes." \
        > "$COMMIT_MSG_FILE"
    fi
  '';
}
