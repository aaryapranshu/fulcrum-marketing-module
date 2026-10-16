# Contributing

Thanks for your interest in contributing to the Fulcrum Marketing Module! This guide will help you add new skills or improve existing ones.

## Requesting a Skill

You can also suggest new skills by [opening a skill request](https://github.com/aaryapranshu/fulcrum-marketing-module/issues/new?template=skill-request.yml).

## Adding a New Skill

### 1. Create the skill directory

```bash
mkdir -p skills/your-skill-name
```

### 2. Create the SKILL.md file

Every skill needs a `SKILL.md` file with YAML frontmatter:

```yaml
---
name: your-skill-name
description: When to use this skill. Include trigger phrases and keywords that help agents identify relevant tasks.
---

# Your Skill Name

Instructions for the agent go here...
```

Optional frontmatter fields: `license` (default: MIT), `metadata` (author, version, etc.)

### 3. Follow the naming conventions

- **Directory name**: lowercase, hyphens only (e.g., `emails`)
- **Name field**: must match directory name exactly
- **Description**: 1-1024 characters, include trigger phrases

### 4. Structure your skill

```
skills/your-skill-name/
├── SKILL.md           # Required - main instructions
├── references/        # Optional - additional documentation
│   └── guide.md
├── scripts/           # Optional - executable code
│   └── helper.py
└── assets/            # Optional - templates, images, data
    └── template.json
```

### 5. Write effective instructions

- Keep `SKILL.md` under 500 lines
- Move detailed reference material to `references/`
- Include step-by-step instructions
- Add examples of inputs and outputs
- Cover common edge cases

## Improving Existing Skills

1. Read the existing skill thoroughly
2. Test your changes locally
3. Keep changes focused and minimal
4. Update the version in metadata if making significant changes

## Mentioning Tools

Name a tool only where an agent needs it, list it alongside the real alternatives (including the free or DIY path), and describe what each option does rather than declaring a winner. If swapping your tool for a competitor makes the section read unfairly, rework it. Fulcrum Labs holds final editorial control.

## Submitting Your Contribution

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-skill-name`)
3. Make your changes
4. Test locally with an AI agent
5. Submit a pull request using the appropriate template (append `?template=<name>.md` to the PR URL to pre-fill it):
   - [New Skill](.github/PULL_REQUEST_TEMPLATE/new-skill.md) — `?template=new-skill.md`
   - [Skill Update](.github/PULL_REQUEST_TEMPLATE/skill-update.md) — `?template=skill-update.md`
   - [Documentation](.github/PULL_REQUEST_TEMPLATE/documentation.md) — `?template=documentation.md`

## Skill Quality Checklist

- [ ] `name` matches directory name
- [ ] `description` clearly explains when to use the skill
- [ ] Instructions are clear and actionable
- [ ] No sensitive data or credentials
- [ ] Follows existing skill patterns in the repo
- [ ] Any tool mentions follow the [integrity rubric](#mentioning-tools-the-integrity-rubric) — options not one answer, disclosed, passes the swap test

## Questions?

Open an issue if you have questions or need help with your contribution.
