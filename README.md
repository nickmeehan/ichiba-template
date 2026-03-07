# Claude Code Plugin Marketplace Template

A template for creating your own Claude Code plugin marketplace — a shared repository where people can publish, discover, and install plugins.

## Quick Start

1. Click **"Use this template"** on GitHub to create your own marketplace repository
2. Name your new repository (e.g., `my-org/dev-plugins`)
3. Update `.claude-plugin/marketplace.json` with your name, org, and description
4. Start creating plugins with `/new-plugin`

That's it — you've got a working marketplace. People can now install plugins directly from it.

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

## Why a Marketplace?

Without a marketplace, sharing skills, agents, and commands means manually downloading files and dropping them into the right directories. A marketplace handles distribution — people can browse what's available and install with a single command instead of wrangling files by hand.

For teams, this also means less duplication and faster onboarding. Shared conventions and workflows are already packaged up and ready to use.

## Links

- [Claude Code Plugins Documentation](https://docs.anthropic.com/en/docs/claude-code/plugins)
- [Plugin Marketplace Guide](https://docs.anthropic.com/en/docs/claude-code/plugin-marketplaces)

## Acknowledgments

This marketplace was built using [ichiba-template](https://github.com/nickmeehan/ichiba-template), based on the [ichiba](https://github.com/nickmeehan/ichiba) project.

## License

The template infrastructure (generator script, skill authoring guide, commands, and scaffolding) is licensed under Apache 2.0 with Commons Clause — see [LICENSE](./LICENSE) and [NOTICE](./NOTICE) for details.

**Your plugins and content are yours.** Any plugins you create, documentation you write, and customizations you make are your own work — license them however you want.
