#!/usr/bin/env bash
# Pull the latest skills from coreyhaines31/marketingskills into this repo.
# Fulcrum changes live in fulcrum/ and README's Fulcrum section, so merges stay clean.
set -euo pipefail
cd "$(dirname "$0")/../.."

git remote get-url upstream >/dev/null 2>&1 || \
  git remote add upstream https://github.com/coreyhaines31/marketingskills.git

git fetch upstream
git merge --no-edit upstream/main
git push origin main
