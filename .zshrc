# Load common config for bash and zsh
source ~/dotfiles/common.sh

export plugins=(
  git
  yarn
  fzf
  zsh_reload
)

# Clean up and reload zsh config including completion
# https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#completion-issues
alias reload_zsh="rm -f ~/.zcompdump* && src"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
