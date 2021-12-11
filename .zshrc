# Load common config for bash and zsh
source ~/dotfiles/common.sh

export plugins=(
  git
  yarn
  fzf
)

# Clean up and reload zsh config including completion
# https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#completion-issues
alias reload_zsh="rm -f ~/.zcompdump* && omz reload"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmux
alias tm=tmux
