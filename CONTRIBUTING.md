# Contributing Plugins

> **Note:** This is a template contribution guide. Customize it for your marketplace.

---

## Reference: Creating Plugins

### Option 1: Using Anthropic's Plugin-Dev Toolkit (Recommended)

1. **Install the plugin-dev toolkit**:

```bash
/plugin marketplace add anthropics/claude-plugins-official
/plugin install plugin-dev@claude-plugins-official
```

2. **Create your plugin**:

```bash
/plugin-dev:create-plugin [description of what your plugin does]
```

3. **Move your plugin to this repo's `plugins/` directory**:

```bash
mv ~/.config/claude/plugins/your-plugin-name /path/to/your-marketplace/plugins/
```

4. **Add an entry to `.claude-plugin/marketplace.json`**:

```json
{
  "plugins": [
    {
      "name": "your-plugin-name",
      "version": "1.0.0",
      "description": "Clear description of what your plugin does",
      "path": "plugins/your-plugin-name"
    }
  ]
}
```

5. Test your plugin locally

### Option 2: Manual Creation

If you prefer to create your plugin manually:

1. Create a directory under `plugins/` with your plugin name
2. Create `.claude-plugin/plugin.json` in your plugin directory
3. Add your commands, agents, skills, hooks, or MCP configurations
4. Update the marketplace manifest
5. Test your plugin locally

## Plugin Structure

A typical plugin structure looks like:

```
plugins/your-plugin-name/
├── .claude-plugin/
│   └── plugin.json           # Plugin manifest (required)
├── commands/
│   └── *.md                  # Slash commands
├── agents/
│   └── *.md                  # Agents
├── skills/
│   └── skill-name/
│       └── SKILL.md          # Skills
├── hooks/
│   └── hooks.json            # Hooks configuration
├── .mcp.json                 # MCP server configuration
└── README.md                 # Plugin documentation (recommended)
```

## Requirements

Before submitting your plugin, ensure:

- **Accurate description**: Your plugin's description is how people will find it. Be specific and clear.
- **Working state**: The plugin should be tested and functional
- **README**: Include basic usage instructions in your plugin's README
- **Valid JSON**: All JSON files (plugin.json, hooks.json, .mcp.json) must be valid
- **Version**: Follow semantic versioning (e.g., 1.0.0)

## Plugin Manifest Example

Your `plugins/your-plugin-name/.claude-plugin/plugin.json` should look like:

```json
{
  "name": "your-plugin-name",
  "version": "1.0.0",
  "description": "A clear, specific description of what your plugin does (at least 20 characters)",
  "author": "Your Name",
  "components": {
    "commands": ["command-name"],
    "agents": ["agent-name"],
    "skills": ["skill-name"],
    "hooks": true,
    "mcp": true
  }
}
```

## Commit Message Guidelines

We use [Conventional Commits](https://www.conventionalcommits.org/) for clear, consistent commit messages. **The scope drives automated releases**, so it matters:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Scope rules (enforced by CI)

- For plugin changes, the scope **must** be the plugin's directory name under `plugins/`. A `feat(my-plugin): ...` commit triggers a release for `my-plugin`.
- One commit must not touch more than one `plugins/<name>/` subtree — `bin/check-plugin-scope.sh` rejects cross-plugin commits. Split them.
- Shared/infra changes (`bin/`, `.github/`, top-level docs) use unscoped types (`ci:`, `chore:`, `docs:`) and never trigger a release.
- `deps` and `release` are also valid non-plugin scopes (extend `commitlint.config.js` to add more).

### Types and release impact

| Type | Release for the scoped plugin |
| ---- | ----------------------------- |
| `feat` | minor bump |
| `fix` | patch bump |
| `perf` | patch bump |
| `refactor!` (or any `!` / `BREAKING CHANGE`) | major bump |
| `docs`, `chore`, `test`, `ci`, `style`, `build` | no release |

### Examples

```
feat(commit-helper): add conventional commits plugin

Generates commit messages following conventional commits format.
Includes configurable scopes and automatic type detection.
```

```
fix(pr-template): handle repositories without package.json

Falls back to git log when package.json is not available.
```

```
docs: add installation instructions to README
```

## Best Practices

### Writing Good Descriptions

❌ Bad: "Helps with commits"
✅ Good: "Generates commit messages following conventional commits format"

❌ Bad: "Code review tool"
✅ Good: "Runs a structured security-focused code review checklist"

### Designing for Extensibility

If your plugin includes skills, consider designing them to read configuration from the repository:

- Check for `.claude/config/your-plugin-config.md` for custom rules
- Look for relevant sections in `CLAUDE.md` or project READMEs
- Allow teams to extend behavior without copying your entire skill

### When to Split Plugins

Consider creating separate plugins when:

- Behaviors are independent (e.g., separate plugins for linting vs formatting)
- Teams might want different combinations
- Some parts use hooks/MCP (which can't be overridden) and you want them to be optional

## Questions?

For questions about plugin development:

1. Check the [Claude Code Plugins Documentation](https://docs.anthropic.com/en/docs/claude-code/plugins)
2. Open an issue in this repository

## Code of Conduct

- Be respectful and constructive in all interactions
- Provide helpful feedback on others' contributions
- Focus on solving real problems and improving developer experience
- Share knowledge and help others learn
- Write clear documentation so others can understand and adapt your work
