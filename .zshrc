export ZSH="$HOME/.config/.oh-my-zsh"

# Add Scala
export PATH="$PATH:/home/n0pl4c3/.local/share/coursier/bin"

ZSH_THEME="robbyrussell"

plugins=(
  git
  rust
  colored-man-pages
)

# EnvVars for VPS etc.
source $HOME/.config/variables/addresses

source $ZSH/oh-my-zsh.sh

# TODO Emacs
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias dotman='/usr/bin/git --git-dir=$HOME/Repositories/dotfiles --work-tree=$HOME'

# Stolen from wiki.waifu.haus, really nice idea
wiki () {
  mkdir -pv "$HOME"/Downloads/wiki
  case $1 in
    (pull) rsync -u -r -h --progress "$VPS1":"$VPS_WIKI_DIR" "$HOME"/Downloads/wiki/ ;;
    (push) rsync -u -r -h --progress "$HOME"/Downloads/wiki/index.html "$VPS1":"$VPS_WIKI_DIR" ;;
    (open) xdg-open file://"$HOME"/Downloads/wiki/index.html ;;
    (*) echo "Unknown command $1"
            return 1 ;;
    esac
}

# To prevent issues with ssh and missing terminfo
alias ssh="TERM=xterm-256color ssh"

# Should be working out of the box but eh
alias ZZZ="zzz -Z"
