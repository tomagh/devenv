# Source this file from ~/.zshenv

source "${0:A:h}/modules/modules.zsh"

# Load enabled zshenv.zsh
for module in "${TOMAGH_MODULES[@]}"; do
    local _path="${0:A:h}/modules/$module/zshenv.zsh"
    if [[ -f "$_path" ]]; then
        source "$_path"
    fi
done
