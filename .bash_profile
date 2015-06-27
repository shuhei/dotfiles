# ------- Add spice to life -------

# Colorful ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colorful prompt
prompt_command() {
  local EMOJIS=("🍺" "🍜" "🍣" "🌲" "🎪" "🌞" "🌛" "🍷" "⭐️" "⚡️" "🌸")
  local SIZE=${#EMOJIS[@]}
  local RAND=$[ $RANDOM % $SIZE ]
  local EMOJI=${EMOJIS[$RAND]}
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1="[\[\e[0;33m\]\w\[\e[m\]]\[\e[0;37m\]$(__git_ps1)\[\e[m\] ${EMOJI}  "
}
if [ "$(uname)" == "Darwin" ]; then
  export PROMPT_COMMAND=prompt_command
else
  export PS1="[\[\e[0;33m\]\w\[\e[m\]]\[\e[0;36m\] $ \[\e[m\]"
fi

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
alias todo="grep -rn --color TODO ./*"

# Find process
alias proc='ps ax | grep'
