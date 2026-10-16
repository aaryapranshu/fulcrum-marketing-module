#!/usr/bin/env bash
# Install these skills into a FulcrumOS workspace.
# Usage: fulcrum/scripts/install.sh "/path/to/FULCRUM LABS OS"
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
TARGET="${1:?Usage: install.sh <path to FulcrumOS workspace>}"

mkdir -p "$TARGET/.claude/skills" "$TARGET/.claude/marketing-tools" "$TARGET/.agents"

for dir in "$REPO"/skills/*/; do
  name="$(basename "$dir")"
  rsync -a --delete --exclude evals "$dir" "$TARGET/.claude/skills/$name/"
done

rsync -a "$REPO/tools/" "$TARGET/.claude/marketing-tools/"
cp "$REPO/LICENSE" "$TARGET/.claude/marketing-tools/LICENSE-fulcrum-marketing-module"

# The bridge file is Fulcrum-owned. Don't clobber a workspace copy that's been edited.
if [ ! -f "$TARGET/.agents/product-marketing.md" ]; then
  cp "$REPO/fulcrum/product-marketing.md" "$TARGET/.agents/product-marketing.md"
else
  echo "Kept existing $TARGET/.agents/product-marketing.md (diff against fulcrum/product-marketing.md if needed)"
fi

echo "Installed $(ls -d "$REPO"/skills/*/ | wc -l | tr -d ' ') skills into $TARGET/.claude/skills"
