# Claude Code Plugin Marketplace Template

A template for creating your own Claude Code plugin marketplace — a shared repository where teams can publish, discover, and install plugins.

## Quick Start

1. Click **"Use this template"** on GitHub to create your own marketplace repository
2. Name your new repository (e.g., `my-org/dev-plugins`)
3. Update `.claude-plugin/marketplace.json` with your name, org, and description
4. Start creating plugins with `/new-plugin`

## What's Included

This template comes with built-in tooling to get you productive immediately:

- **Plugin generator script** (`bin/generate-plugin.sh`) — scaffolds a new plugin with all the right directories and files
- **`/new-plugin` command** — create plugins directly from Claude Code
- **Skill authoring guide** (`.claude/skills/create-skill/`) — reference for writing well-structured skills
- **Contributing guide template** (`CONTRIBUTING.md`) — ready to customize for your team

## Repository Structure

```
your-marketplace/
├── .claude-plugin/
│   └── marketplace.json       # Marketplace manifest
├── .claude/
│   ├── commands/
│   │   └── new-plugin.md      # /new-plugin command
│   └── skills/
│       ├── create-skill/      # Skill authoring guide
│       └── new-plugin-skill/  # Natural language plugin creation
├── bin/
│   └── generate-plugin.sh     # Plugin generator script
├── plugins/
│   └── (your plugins go here)
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

## Customization Checklist

After creating your repository from this template, update the following:

- [ ] Update `marketplace.json` with your name and repository
- [ ] Update this `README.md` for your marketplace
- [ ] Update the default author in `bin/generate-plugin.sh`
- [ ] Update `CONTRIBUTING.md` for your contribution policy
- [ ] Update or replace the `LICENSE` for your needs
- [ ] Delete this checklist once done

## For Teams

A plugin marketplace helps teams:

- **Reduce duplication** — share solutions across teams instead of reinventing them
- **Spread best practices** — codify conventions in plugins everyone can use
- **Continuous improvement** — tooling gets better as people contribute enhancements
- **Low friction adoption** — easy for team members to discover and install useful tools

## Links

- [Claude Code Plugins Documentation](https://docs.anthropic.com/en/docs/claude-code/plugins)
- [Plugin Marketplace Guide](https://docs.anthropic.com/en/docs/claude-code/plugin-marketplaces)

## License

Apache 2.0 with Commons Clause — see [LICENSE](./LICENSE) and [NOTICE](./NOTICE) for details. You should choose the license that best fits your marketplace.
