#!/bin/bash

# validate-plugin.sh
# Checks plugin directories for leftover scaffold/placeholder files
# Exits non-zero if any are found — use as a pre-commit check

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}→${NC} $1"
}

# Known scaffold files that should not be committed
SCAFFOLD_FILES=(
    "commands/example.md"
    "agents/example.md"
    "skills/example/SKILL.md"
    "hooks/README.md"
    ".mcp.json.example"
    "MCP_README.md"
)

# Validate a single plugin directory
validate_plugin() {
    local plugin_dir="$1"
    local plugin_name
    plugin_name="$(basename "$plugin_dir")"
    local found_issues=0

    print_info "Validating plugin: $plugin_name"

    for scaffold_file in "${SCAFFOLD_FILES[@]}"; do
        local full_path="$plugin_dir/$scaffold_file"
        if [ -f "$full_path" ]; then
            print_error "  Scaffold file found: $scaffold_file"
            found_issues=1
        fi
    done

    # Special check for hooks/hooks.json — only flag if it still contains placeholder content
    local hooks_json="$plugin_dir/hooks/hooks.json"
    if [ -f "$hooks_json" ]; then
        if grep -q "echo 'File modified" "$hooks_json" 2>/dev/null; then
            print_error "  hooks/hooks.json contains placeholder content — replace with real hooks config"
            found_issues=1
        fi
    fi

    if [ "$found_issues" -eq 0 ]; then
        print_success "  $plugin_name looks clean"
    fi

    return $found_issues
}

# Main script
main() {
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    PLUGINS_DIR="$REPO_ROOT/plugins"

    local overall_status=0

    if [ -n "$1" ]; then
        # Validate a single plugin passed as argument
        local plugin_dir="$REPO_ROOT/$1"
        if [ ! -d "$plugin_dir" ]; then
            # Try as absolute path
            plugin_dir="$1"
        fi
        if [ ! -d "$plugin_dir" ]; then
            print_error "Plugin directory not found: $1"
            exit 1
        fi
        validate_plugin "$plugin_dir" || overall_status=1
    else
        # Validate all plugins
        if [ ! -d "$PLUGINS_DIR" ]; then
            print_error "No plugins directory found at $PLUGINS_DIR"
            exit 1
        fi

        local plugin_count=0
        for plugin_dir in "$PLUGINS_DIR"/*/; do
            if [ -d "$plugin_dir" ]; then
                validate_plugin "$plugin_dir" || overall_status=1
                plugin_count=$((plugin_count + 1))
            fi
        done

        if [ "$plugin_count" -eq 0 ]; then
            print_info "No plugins found in $PLUGINS_DIR"
        fi
    fi

    echo
    if [ "$overall_status" -eq 0 ]; then
        print_success "All plugins passed validation"
    else
        print_error "Validation failed — remove or replace scaffold files before committing"
    fi

    exit $overall_status
}

main "$@"
