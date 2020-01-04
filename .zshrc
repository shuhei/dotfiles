# Load common config for bash and zsh
source ~/dotfiles/common.sh

export plugins=(
  git
  yarn
  fzf
  zsh_reload
)

# Disable the `y` alias from oh-my-zsh yarn plugin.
# It's annoying when I run `y` by mistake and yarn creates `yarn.lock`
# in non-JavaScript projects.
unalias y

# Clean up and reload zsh config including completion
# https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#completion-issues
alias reload_zsh="rm -f ~/.zcompdump* && src"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
