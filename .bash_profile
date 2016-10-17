# Git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# ------- Add spice to life -------

# Colorful ls
export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagaced'

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
  export PS1="[${yellow}\w${reset}]${gray}$(__git_ps1)${reset} ${status_color}λ${reset} "
}
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND=prompt_command

# Colorful grep
export GREP_OPTIONS='--color=auto'

# Colorful less
export LESS='-R'

# ------- Aliases -------

# vim
alias vi='vim'

# bundler
alias be='bundle exec'

# Safety
alias rm='rm -i'
alias mv='mv -i'

# Todo
alias todo='grep -rn --color TODO ./*'

# Find process
alias proc='ps ax | grep'

# iOS Simulator
alias iossim='open -n /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

# npm local bin
alias nbin='PATH=$(npm bin):$PATH'

# ------- Path -------
export PATH=$HOME/dotfiles/bin:$PATH
