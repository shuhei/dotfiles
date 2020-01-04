# Load common config for bash and zsh
source ~/dotfiles/common.sh

export plugins=(
  git
  yarn
  fzf
  zsh_reload
)

# It's annoying when I run `y` by mistake and `yarn` creates `yarn.lock`
# in non-JavaScript projects.
unalias y

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
