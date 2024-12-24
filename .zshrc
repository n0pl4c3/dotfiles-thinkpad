export ZSH="$HOME/.config/.oh-my-zsh"
export PATH="$PATH:/home/n0pl4c3/.local/bin/:/home/n0pl4c3/.nimble/bin/"
ZSH_THEME="robbyrussell"

plugins=(
  git
  rust
  colored-man-pages
)

# EnvVars for VPS etc.
source $HOME/.config/variables/addresses

source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

# Aliases
alias dotman='/usr/bin/git --git-dir=$HOME/Repositories/dotfiles --work-tree=$HOME'
alias ssh="TERM=xterm-256color ssh"
alias ZZZ="sudo zzz -Z"
alias c="clear"
alias ..="cd .."

# Functions
nvim() {
    kitty @set-colors background=#1E1E2E && /sbin/nvim "$1" && kitty @set-colors background=#FFFEFF
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

miniterm() {
    python3 -m serial.tools.miniterm "$1" "$2"
}

# Prompt
eval "$(starship init zsh)"

[ -f "/home/n0pl4c3/.ghcup/env" ] && . "/home/n0pl4c3/.ghcup/env" # ghcup-env
