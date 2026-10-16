#!/usr/bin/env bash
# Install the Fulcrum Marketing Module into a FulcrumOS workspace (macOS / Linux).
#
# Usage: fulcrum/scripts/install.sh <workspace> [--force] [--with-fulcrum-bridge]
#
#   --force                 replace a same-named skill that this module didn't install
#   --with-fulcrum-bridge   also install Fulcrum Labs' own product-marketing bridge
#                           (Fulcrum's internal workspace only, never a client's)
#
# Safe to re-run: skills this module installed are updated in place; anything else is left alone.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
TARGET=""
FORCE=0
BRIDGE=0
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=1 ;;
    --with-fulcrum-bridge) BRIDGE=1 ;;
    -*) echo "Unknown option: $arg" >&2; exit 2 ;;
    *) TARGET="$arg" ;;
  esac
done
[ -n "$TARGET" ] || { echo "Usage: install.sh <workspace> [--force] [--with-fulcrum-bridge]" >&2; exit 2; }
[ -d "$TARGET" ] || { echo "Workspace not found: $TARGET" >&2; exit 1; }

MARKER=".fulcrum-marketing-module"
SKILLS="$TARGET/.claude/skills"
mkdir -p "$SKILLS" "$TARGET/.claude/marketing-tools"

installed=0; updated=0; skipped=()
for dir in "$REPO"/skills/*/; do
  name="$(basename "$dir")"
  dest="$SKILLS/$name"
  if [ -d "$dest" ]; then
    if [ ! -f "$dest/$MARKER" ] && [ "$FORCE" -ne 1 ]; then
      skipped+=("$name"); continue
    fi
    rm -rf "$dest"; updated=$((updated + 1))
  else
    installed=$((installed + 1))
  fi
  cp -R "$dir" "$dest"
  rm -rf "$dest/evals"
  touch "$dest/$MARKER"
done

rm -rf "$TARGET/.claude/marketing-tools"
cp -R "$REPO/tools" "$TARGET/.claude/marketing-tools"
cp "$REPO/LICENSE" "$TARGET/.claude/marketing-tools/LICENSE"

if [ "$BRIDGE" -eq 1 ]; then
  mkdir -p "$TARGET/.agents"
  if [ -f "$TARGET/.agents/product-marketing.md" ]; then
    echo "Kept existing .agents/product-marketing.md"
  else
    cp "$REPO/fulcrum/product-marketing.md" "$TARGET/.agents/product-marketing.md"
  fi
fi

echo "Installed: $installed  Updated: $updated  Skipped (name clash): ${#skipped[@]}"
if [ "${#skipped[@]}" -gt 0 ]; then
  echo "Skipped because a skill with the same name already exists and wasn't installed by this module:"
  printf '  - %s\n' "${skipped[@]}"
  echo "Re-run with --force to replace them."
fi
