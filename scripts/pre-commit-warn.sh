#!/usr/bin/env bash
set -euo pipefail

echo "Pre-commit: running non-blocking checks (warnings only)..."

if command -v npx >/dev/null 2>&1; then
  if ! npx prettier . --check; then
    echo "WARNING: Prettier check failed. Run: npx prettier . --write"
  fi
else
  echo "WARNING: npx not found; skipping Prettier. Install Node.js/npm."
fi

if command -v lychee >/dev/null 2>&1; then
  lychee_args=(
    --exclude-path README.md
    --exclude-path _pages/404.md
    --exclude-path _pages/blog.md
    --exclude-path _posts/2018-12-22-distill.md
    --verbose
    --no-progress
    "./**/*.md"
    "./**/*.html"
  )
  if ! lychee "${lychee_args[@]}"; then
    echo "WARNING: Link check failed. Run: lychee ${lychee_args[*]}"
  fi
else
  echo "WARNING: lychee not found; skipping link check. Install lychee."
fi

exit 0
