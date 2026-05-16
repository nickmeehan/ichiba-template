# Claude Code Plugin Marketplace Template

A template for creating your own Claude Code plugin marketplace — a shared repository where people can publish, discover, and install plugins.

## Quick Start

1. Click **"Use this template"** on GitHub to create your own marketplace repository
2. Name your new repository (e.g., `my-org/dev-plugins`)
3. Update `.claude-plugin/marketplace.json` with your name, org, and description
4. Start creating plugins with Anthropic's [`plugin-dev`](https://github.com/anthropics/claude-plugins-official) plugin (enabled out of the box)

That's it — you've got a working marketplace. People can now install plugins directly from it.

## What's Included

- **Anthropic `plugin-dev` and `skill-creator` plugins** — enabled in `.claude/settings.json` so you can author plugins and skills without leaving Claude Code
- **Automated per-plugin releases** (`.github/workflows/release.yml`) — `semantic-release` bumps each plugin independently from Conventional Commits, tags it (`<plugin>-v<semver>`), and updates the marketplace manifest in one commit
- **CI validation** (`.github/workflows/validate.yml`) — runs `claude plugin validate` on the marketplace and every plugin, lints commits and PR titles with `commitlint`, and rejects cross-plugin commits
- **Pre-commit schema validation** (`bin/install-hooks.sh`) — auto-installed on SessionStart; runs `claude plugin validate` whenever a manifest is staged
- **Contributing guide** (`CONTRIBUTING.md`) — a ready-to-customize template so contributors know how to add plugins

## Repository Structure

```
your-marketplace/
├── .claude-plugin/
│   └── marketplace.json       # Marketplace manifest
├── .claude/
│   └── settings.json          # Enabled plugins + SessionStart hooks
├── .github/
│   └── workflows/
│       ├── release.yml        # Per-plugin semantic-release
│       └── validate.yml       # Plugin + commit validation
├── bin/
│   ├── install-hooks.sh       # Installs the pre-commit hook
│   ├── check-plugin-scope.sh  # Rejects cross-plugin commits
│   └── release-bump.sh        # Writes new versions during release
├── plugins/
│   └── (your plugins go here)
├── commitlint.config.js       # Conventional Commits + plugin-scope rules
├── release.config.js          # semantic-release per-plugin config
├── package.json               # pnpm dev deps (release/lint tooling only)
├── CLAUDE.md                  # Conventions for contributors and Claude
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

## Customization Checklist

After creating your repository from this template, update the following:

- [ ] Update `.claude-plugin/marketplace.json` with your name and description
- [ ] Update this `README.md` for your marketplace
- [ ] Update `CONTRIBUTING.md` for your contribution policy
- [ ] Update or replace the `LICENSE` for your needs
- [ ] Add a `RELEASE_TOKEN` repo secret (fine-grained PAT with `contents: write`) so `release.yml` can push tags and bump commits back to `main`
- [ ] Run `pnpm install` once locally to materialise `node_modules` for commitlint
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
