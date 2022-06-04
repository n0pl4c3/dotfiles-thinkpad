# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/n0pl4c3/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# For dotfile management
alias dotman='/usr/bin/git --git-dir=$HOME/repositories/dotfiles --work-tree=$HOME'
