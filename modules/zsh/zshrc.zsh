source <(fzf --zsh)
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
eval "$(zoxide init zsh)"

# zinit
source "$(brew --prefix zinit)/zinit.zsh"
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt share_history 
setopt hist_ignore_space # start (sensitive) command with space to ignore it in history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_verify


# export FZF_DEFAULT_COMMAND="fd --type file --color=always"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always {} | head -500'"
# export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'

