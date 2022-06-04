export ZSH="$HOME/.config/.oh-my-zsh"

ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# TODO Emacs
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias dotman='/usr/bin/git --git-dir=$HOME/repositories/dotfiles --work-tree=$HOME'
