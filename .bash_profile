# Colorful ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colorful prompt
export PS1="[\e[0;37m\u@\h\e[0;33m \W\e[m]$ "

# Colorful grep
export GREP_OPTIONS='--color=auto'

# Colorful less
export LESS='-R'

# Find process
alias proc='ps ax | grep'
