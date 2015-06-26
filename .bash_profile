# ------- Add spice to life -------

# Colorful ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colorful prompt
if [ "$(uname)" == "Darwin" ]; then
  emojis[0]="🍺"
  emojis[1]="🍜"
  emojis[2]="🍣"
  emojis[3]="🌴"
  emojis[4]="🎪"
  rand=$[ $RANDOM % 5 ]
  emoji=${emojis[$rand]}
  export PS1="\[\e[0;33m\]\W\[\e[m\] ${emoji}  "
else
  export PS1="\[\e[0;37m\]\W\[\e[0;33m\] $ \[\e[m\]"
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
