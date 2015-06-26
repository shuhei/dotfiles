# ------- Add spice to life -------

# Colorful ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colorful prompt
if [ "$(uname)" == "Darwin" ]; then
  emojis=("🍺" "🍜" "🍣" "🌲" "🎪" "🌞" "🌛" "🍷" "⭐️" "⚡️" "🌸")
  size=${#emojis[@]}
  rand=$[ $RANDOM % size ]
  emoji=${emojis[$rand]}
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1="[\[\e[0;33m\]\w\[\e[m\]]\[\e[0;37m\]$(__git_ps1)\[\e[m\] ${emoji}  "
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
