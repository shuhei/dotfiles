# ------- Add spice to life -------

# Colorful ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colorful prompt
export PS1="[\[\e[0;37m\]\u@\h\[\e[0;33m\] \W\[\e[m\]]$ "

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
