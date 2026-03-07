# Claude Code Plugin Marketplace Template

A shared repository where your team can publish, discover, and install Claude Code plugins — so everyone benefits from the best tools and workflows instead of reinventing them.

## Quick Start

1. Click **"Use this template"** on GitHub to create your own marketplace repository
2. Name your new repository (e.g., `my-org/dev-plugins`)
3. Update `.claude-plugin/marketplace.json` with your name, org, and description
4. Start creating plugins with `/new-plugin`

That's it — you've got a working marketplace. Your team can now install plugins directly from it.

## What's Included

- **Plugin generator** (`bin/generate-plugin.sh`) — scaffolds a complete plugin in seconds with the right structure out of the box
- **`/new-plugin` skill** — create plugins without leaving Claude Code
- **Skill authoring guide** (`.claude/skills/create-skill/`) — everything you need to write well-structured, effective skills
- **Contributing guide** (`CONTRIBUTING.md`) — a ready-to-customize template so contributors know how to add plugins

## Repository Structure

```
your-marketplace/
├── .claude-plugin/
│   └── marketplace.json       # Marketplace manifest
├── .claude/
│   └── skills/
│       ├── create-skill/      # Skill authoring guide
│       └── new-plugin/        # Plugin creation skill
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

Good tooling compounds. When one person builds a useful plugin, everyone on the team should be able to use it. A shared marketplace makes that happen — no Slack messages asking "hey can you share that script?", no copy-pasting between repos, no reinventing what someone already built last quarter.

As people contribute, the marketplace gets better. Conventions get codified. Best practices spread naturally. And new team members get productive faster because the tools are already there.

## Links

- [Claude Code Plugins Documentation](https://docs.anthropic.com/en/docs/claude-code/plugins)
- [Plugin Marketplace Guide](https://docs.anthropic.com/en/docs/claude-code/plugin-marketplaces)

## Acknowledgments

This marketplace was built using the [ichiba-template](https://github.com/nickmeehan/ichiba-template) by Nick Meehan, based on the [ichiba](https://github.com/nickmeehan/ichiba) project.

## License

The template infrastructure (generator script, skill authoring guide, commands, and scaffolding) is licensed under Apache 2.0 with Commons Clause — see [LICENSE](./LICENSE) and [NOTICE](./NOTICE) for details.

**Your plugins and content are yours.** Any plugins you create, documentation you write, and customizations you make are your own work — license them however you want.
