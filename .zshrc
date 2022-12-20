source ~/.config/zsh/plugins.zsh
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Default editor
export EDITOR=nvim
export VISUAL=nvim


# Colorize output
alias ls='ls --color=auto'

# set a different color for suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

export GOPATH="${HOME}/go"
# Gcr socket for gnome keyring and ssh
export SSH_AUTH_SOCK=/run/user/$(id -u)/gcr/ssh

export PATH="${PATH}:${HOME}/.krew/bin:${HOME}/.cargo/bin:${HOME}/.gem/ruby/2.7.0/bin:${HOME}/.npm/bin:${HOME}/go/bin/:${HOME}/.local/bin"
alias ssh="TERM=xterm-256color ssh"

# Setup fzf install directory
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit

# Start starship.rs
eval "$(starship init zsh)"
