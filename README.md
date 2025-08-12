# devenv
My development environment for personal use.

## How it is organised
- `modules/modules.zsh` 
    - defines `TOMAGH_MODULES` if not defined before, that allows to enable modules from outside, e.g. in `~/.zshenv`.
    - is used by other script in defined order
- `setup.zsh` 
    - perfomes `brew bundle --file` for all `Brewfile`s in enabled modules
    - `source`s all `setup.zsh` files in enabled modules
        - use `-f` (force) option automatically to replace possible existing files
- `zshenv.zsh` 
    - is expected to be `source`d in `~/.zshenv`
    - `source`s all `zshenv.zsh` files in enabled modules
- `zshrc.zsh`
    - is expected to be `source`d in `~/.zshrc`
    - `source`s all `zshrc.zsh` files in enabled modules
    - calls `autoload -Uz compinit; compinit`
    - `source`s all `zstyle.zsh` files in enabled modules
    - (temporarily) has definitions of custom aliases

## Used tools and plugins
### Terminal
- [**WezTerm**](https://wezterm.org)

### zsh
- [`zinit`](https://github.com/zdharma-continuum/zinit) - flexible and fast `zsh` plugin manager.
- [`fd`](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to `find`.
- [`bat`](https://github.com/sharkdp/bat) - a `cat`(1) clone with wings.
- [`hexyl`](https://github.com/sharkdp/hexyl) - a hex viewer for the terminal.
- [`tldr`](https://github.com/tldr-pages/tldr) - collaborative cheatsheets for console commands. Friendly `man`.
- [`eza`](https://github.com/eza-community/eza) - a modern replacement for `ls`.
- [`zoxide`](https://github.com/ajeetdsouza/zoxide) - a smarter `cd` command, inspired by z and autojump.
- [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting) - `Fish shell`-like syntax highlighting for `zsh`.
- [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions) - `Fish`-like fast/unobtrusive autosuggestions for `zsh`.
- [`zsh-completions`](https://github.com/zsh-users/zsh-completions) - additional completion definitions for 'zsh`.
- [`fzf`](https://github.com/junegunn/fzf) - a general-purpose command-line fuzzy finder.
    - [README](https://github.com/junegunn/fzf/blob/master/README.md)
    - [Advanced fzf examples](https://github.com/junegunn/fzf/blob/master/ADVANCED.md)
    - [Related projects](https://github.com/junegunn/fzf/wiki/Related-projects)
    - [Community examples](https://github.com/junegunn/fzf/wiki/examples)
- [`fzf-tab`](https://github.com/Aloxaf/fzf-tab) - replace zsh's default completion selection menu with fzf!
- [`thefuck`](https://github.com/nvbn/thefuck) - a magnificent app which corrects your previous console command.

### Finder
- [**QLMarkdown**](https://github.com/sbarex/QLMarkdown) - a macOS Quick Look extension to preview Markdown files.