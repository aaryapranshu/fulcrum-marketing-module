# Installing the Fulcrum Marketing Module

These instructions are written for the AI agent (Claude Code or similar) doing the install. Follow them in order. Re-running them later updates the module in place.

## 1. Find the workspace

The workspace is the user's OS folder: the directory this session is running in (it usually has a `CLAUDE.md`, and often `intel/` and `playbook/` folders). Tell the user which folder you're installing into before changing anything. If the session isn't running inside an OS folder, ask which folder to use.

## 2. Get the module

Keep one copy of the module outside the workspace so it can be updated later:

- macOS / Linux: `~/.fulcrum/fulcrum-marketing-module`
- Windows: `%USERPROFILE%\.fulcrum\fulcrum-marketing-module`

If that folder doesn't exist, clone it:

```
git clone --depth 1 https://github.com/aaryapranshu/fulcrum-marketing-module.git <that folder>
```

If it exists, update it with `git -C <that folder> pull --ff-only`. If the pull fails, delete the folder and clone again.

If `git` isn't installed, download and unzip https://github.com/aaryapranshu/fulcrum-marketing-module/archive/refs/heads/main.zip into that folder instead (the zip contains a `fulcrum-marketing-module-main` folder; its contents are the module).

Never clone into the workspace itself, and avoid cloud-synced folders like Desktop or Documents on iCloud/OneDrive.

## 3. Copy the skills in

**macOS / Linux:**

```
bash ~/.fulcrum/fulcrum-marketing-module/fulcrum/scripts/install.sh "<workspace>"
```

**Windows (PowerShell):**

```powershell
$repo = "$HOME\.fulcrum\fulcrum-marketing-module"
$ws = "<workspace>"
$skills = Join-Path $ws ".claude\skills"
New-Item -ItemType Directory -Force -Path $skills | Out-Null
Get-ChildItem "$repo\skills" -Directory | ForEach-Object {
  $dest = Join-Path $skills $_.Name
  if (Test-Path $dest) {
    if (-not (Test-Path "$dest\.fulcrum-marketing-module")) { Write-Output "SKIPPED (name clash): $($_.Name)"; return }
    Remove-Item $dest -Recurse -Force
  }
  Copy-Item $_.FullName $dest -Recurse
  Remove-Item "$dest\evals" -Recurse -Force -ErrorAction SilentlyContinue
  New-Item -ItemType File -Path "$dest\.fulcrum-marketing-module" | Out-Null
}
$tools = Join-Path $ws ".claude\marketing-tools"
Remove-Item $tools -Recurse -Force -ErrorAction SilentlyContinue
Copy-Item "$repo\tools" $tools -Recurse
Copy-Item "$repo\LICENSE" "$tools\LICENSE"
```

Both put the 50 skills in `<workspace>/.claude/skills/` and the tool guides in `<workspace>/.claude/marketing-tools/`. Each installed skill gets a `.fulcrum-marketing-module` marker file so later runs know it's safe to update.

**Name clashes:** if the user already has a skill with the same name that this module didn't install, it is skipped, not overwritten. List the skipped names for the user and ask whether to replace them. Only replace with their yes (`--force` on macOS/Linux; on Windows, delete that one folder and re-run).

Do **not** install `fulcrum/product-marketing.md`. That file is Fulcrum Labs' own positioning, not the user's.

## 4. Give the skills the user's business context

Every skill reads `<workspace>/.agents/product-marketing.md` first. It must describe **the user's** business, never Fulcrum Labs.

- **If it already exists:** leave it alone.
- **If the workspace has `intel/` or `playbook/` folders:** read them, then write `.agents/product-marketing.md` as a short bridge that points to those files rather than copying them. Use this shape:

  ```markdown
  # Product Marketing Context — <Business name>

  This file is a bridge. Positioning lives in the files below; read them rather than restating them here. If a source file and this file disagree, the source file wins.

  ## Section map → where to read
  | Section | Source of truth |
  |---|---|
  | Product, offer, pricing | <file> |
  | Target audience and personas | <file> |
  | Problems and pain points | <file> |
  | Competitors and differentiation | <file, or **[Gap]**> |
  | Objections | <file, or **[Gap]**> |
  | Customer language | <file, or **[Gap]**> |
  | Brand voice | <file> |
  | Proof points / case studies | <file, or **[Gap]**> |

  ## Hard rules
  1. Proof comes only from the files above. Never invent a result, metric, client or quote. Leave a `[Gap]` empty.
  2. Where a skill's generic advice conflicts with the voice file, the voice file wins.
  3. Any external message (email, LinkedIn, post) is shown to the user as a draft before it's sent.
  ```

  Only list files that exist. Mark a missing section **[Gap]** instead of filling it.
- **If there's nothing to point to:** don't invent anything. Tell the user to say "set up my product marketing context" to run the `product-marketing` skill's short interview.

## 5. Register the module in CLAUDE.md

Append this section to `<workspace>/CLAUDE.md` (create the file if it doesn't exist). If a "Marketing skills" section already exists, replace only that section and leave the rest of the file exactly as it was.

```markdown
## Marketing skills (Fulcrum Marketing Module)

50 marketing skills live in `.claude/skills/` and trigger automatically on matching requests (cold email, copywriting, offers, pricing, sales enablement, social, SEO, content strategy, launch, analytics, and more). Each one reads `.agents/product-marketing.md` first for this business's context. Tool integration guides and CLIs are in `.claude/marketing-tools/`.
To update: say "update the Fulcrum Marketing Module".
```

## 6. Verify

Check each of these and fix anything that fails:

- Every folder in the module's `skills/` has a matching `<workspace>/.claude/skills/<name>/SKILL.md`, except names skipped for a clash. Its frontmatter `name:` matches the folder name.
- `<workspace>/.claude/marketing-tools/REGISTRY.md` exists.
- `<workspace>/.agents/product-marketing.md` exists and is about the user's business, or the user has been told how to create it.
- `CLAUDE.md` has the Marketing skills section.

The tool CLIs in `marketing-tools/clis/` need API keys only when someone uses that specific tool. Don't ask for keys during install.

## 7. Report back

Tell the user, briefly:

- how many skills were installed or updated, and any skipped for a name clash
- whether their product marketing context was created, already existed, or still needs the interview
- that they should **start a new session** so the skills load, then try something like "write a cold email to a <their ideal customer>"
