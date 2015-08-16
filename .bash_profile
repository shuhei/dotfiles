# ------- Add spice to life -------

# Colorful ls
export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagaced'

# Colorful prompt
light_green="\[\e[1;32m\]"
yellow="\[\e[0;33m\]"
cyan="\[\e[0;36m\]"
gray="\[\e[0;37m\]"
reset="\[\e[m\]"

if [ "$(uname)" == 'Darwin' ]; then
  emojis=('🍺' '🍥' '🍜' '🍕' '🍀' '🍣' '🎪' '🍷' '⚡️' '🍻' '🌵' '🍋' '🍟' '🐷')
  rand="$[ ${RANDOM} % ${#emojis[@]} ]"
  emoji="${emojis[${rand}]}"
  separator="${emoji} "
else
  separator="\$"
fi
separator="${light_green}λ${reset}"

prompt_command() {
  export PS1="[${yellow}\w${reset}]${gray}$(__git_ps1)${reset} ${separator} "
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
