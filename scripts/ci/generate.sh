#!/usr/bin/env bash
set -euo pipefail

# regenerate library
go generate

# Check if a diff is found. If yes, fail.
diff="$(git diff)"
if [[ -n "$diff" ]]; then
  echo "A diff was found when generating the docs. Please commit the changes." >&2
  exit 1
fi
echo "No diff found, all is well!" >&2
