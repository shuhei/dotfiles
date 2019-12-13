# Git completion
if hash brew 2>/dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# ------- Add spice to life -------

# Colorful prompt
light_green="\[\e[1;32m\]"
light_red="\[\e[1;31m\]"
yellow="\[\e[0;33m\]"
cyan="\[\e[0;36m\]"
gray="\[\e[0;37m\]"
reset="\[\e[m\]"

prompt_command() {
  local status="$?"
  local status_color=""
  if [ $status != 0 ]; then
    status_color=$light_red
  else
    status_color=$light_green
  fi
  export PS1="[${yellow}\w${reset}]${gray}$(__git_ps1)${reset} ${status_color}€${reset} "
}
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT_COMMAND=prompt_command

# Load common shell config
source ~/dotfiles/common.sh

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
