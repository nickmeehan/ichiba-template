---
name: new-plugin
description: Create a new blank Claude Code plugin when the user requests to create/make/generate a plugin or wants a plugin for a specific purpose
---

# New Plugin

Create a new Claude Code plugin for this marketplace by executing the plugin generator script at `bin/generate-plugin.sh`.

## When to Use This Skill

Use this skill automatically when the user:
- Asks to "create a plugin for [purpose]"
- Says "make a plugin that [does something]"
- Says "generate a new plugin for [use case]"
- Requests to "create a plugin" without specifying details
- Wants to scaffold a new plugin structure

## Steps

1. **Gather information** — ask the user if not already provided:
   - **Plugin name**: Must be lowercase with hyphens (e.g., "my-awesome-plugin")
   - **Plugin description**: A clear description of what the plugin does (minimum 20 characters)
   - **Author name**: The plugin author (required)

   When parsing natural language:
   - **Description**: The "for [X]" or "that [does Y]" part. Expand to a full sentence if needed.
   - **Name**: Only if explicitly stated (e.g., "create a plugin called X"). Otherwise ask.
   - **Author**: Only if explicitly mentioned. Otherwise ask.

2. **Ask which components the plugin needs** — present these options and let the user choose (multiselect):
   - `commands` — slash command files (`.md` files in `commands/`)
   - `agents` — specialized agent definitions (`.md` files in `agents/`)
   - `skills` — agent skill directories (`skill-name/SKILL.md` in `skills/`)
   - `hooks` — lifecycle event handlers (`hooks.json` in `hooks/`)
   - `mcp` — Model Context Protocol server configurations

   Do **not** default to all components. Only scaffold what the user actually needs.

3. **Run the generator script** with the provided information and selected components:
   ```bash
   ./bin/generate-plugin.sh "<plugin-name>" "<description>" "<author>" "<components>"
   ```
   Where `<components>` is a comma-separated list of selected options, e.g. `"commands,skills"`.

   **IMPORTANT**: Always provide all four arguments to avoid interactive prompts.

4. **Validate the new plugin** to confirm no stale scaffold files were left behind:
   ```bash
   ./bin/validate-plugin.sh "plugins/<plugin-name>"
   ```

5. **Inform the user** of:
   - The plugin location
   - The structure that was created (only selected components)
   - Next steps for adding real content to the scaffolded directories

## Plugin Structure

The generator creates only the directories for selected components. For example, if the user selects `commands` and `skills`:

```
plugins/<plugin-name>/
├── .claude-plugin/
│   └── plugin.json       # Plugin manifest with metadata
├── commands/
│   └── example.md        # Example command template — replace with real commands
├── skills/
│   └── example/
│       └── SKILL.md      # Example skill template — replace with real skills
└── README.md             # Plugin documentation
```

## Important Notes

- The plugin.json will be initialized with empty component arrays
- The marketplace.json will be automatically updated with the new plugin entry
- Only directories for selected components are created
- Example template files are scaffolded as a starting point — users must replace them with real content
- The README includes a basic template to fill out

## After Creation

The user should:
1. Replace example template files with real content
2. Update `plugin.json` to list the actual components
3. Update the README.md with usage examples
4. Run `bin/validate-plugin.sh` before committing to ensure no scaffold files remain
5. Test the plugin locally

## Examples

### Natural Language
```
User: "Create a plugin for managing database migrations"

Actions:
1. Extract description: "managing database migrations"
2. Ask for plugin name and author
3. Ask which components are needed (e.g., user selects "commands,skills")
4. Run: ./bin/generate-plugin.sh "db-migrations" "A plugin for managing database migrations" "author-name" "commands,skills"
5. Run: ./bin/validate-plugin.sh "plugins/db-migrations"
```

### With Explicit Name
```
User: "Create a plugin called awesome-linter for linting code"

Actions:
1. Extract name: "awesome-linter", description: "linting code"
2. Ask for author
3. Ask which components are needed (e.g., user selects "commands")
4. Run: ./bin/generate-plugin.sh "awesome-linter" "A plugin for linting code" "author-name" "commands"
5. Run: ./bin/validate-plugin.sh "plugins/awesome-linter"
```
