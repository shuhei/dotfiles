# Load common shell config
source ~/dotfiles/common.sh

export plugins=(
  git
  yarn
  fzf
  zsh_reload
)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
