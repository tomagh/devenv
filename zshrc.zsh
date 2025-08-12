# Source this file from ~/.zshrc

source "${0:A:h}/modules/modules.zsh" # Load $TOMAGH_MODULES

# Load enabled zshrc.zsh
for module in "${TOMAGH_MODULES[@]}"; do
    local _path="${0:A:h}/modules/$module/zshrc.zsh"
    if [[ -f "$_path" ]]; then
        source "$_path"
    fi
done

# Autocomplete
autoload -Uz compinit
compinit

# Load enabled zstyle.zsh
for module in "${TOMAGH_MODULES[@]}"; do
    local _path="${0:A:h}/modules/$module/zstyle.zsh"
    if [[ -f "$_path" ]]; then
        source "$_path"
    fi
done

# aliases
alias rz="exec zsh" # restart zsh
alias ls="eza --no-quotes --icons --group-directories-first --git-repos-no-status --smart-group"

# fzf
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
