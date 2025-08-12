#!/usr/bin/env zsh
if [[ -z "$ZSH_VERSION" ]]; then
  echo "This script is intended to be sourced from a ZSH shell."
  exit 1
fi

source "${0:A:h}/modules/modules.zsh"
for module in "${TOMAGH_MODULES[@]}"; do
    # berew bundle
    local bundle_path="${0:A:h}/modules/$module/Brewfile"
    if [[ -f "$bundle_path" ]]; then
        brew bundle --file "$bundle_path"
    fi

    # custom installer
    local setup_path="${0:A:h}/modules/$module/setup.zsh"
    if [[ -f "$setup_path" ]]; then
        source "$setup_path" "$@"
    fi
done
