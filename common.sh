# Common shell config for bash and zsh

# Colorful ls
export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagaced'

# Colorful grep
# GREP_OPTIONS is deprecated...
alias grep='grep --color=auto'

# Colorful less
export LESS='-R'

# Tell applications that the terminal accepts UTF-8.
# Using only LC_CTYPE as iTerm2 does.
# This enables tmux to output unicode characters.
export LC_CTYPE='UTF-8'

# ------- Aliases -------

# vim
export EDITOR=$(which vim)

# Safety
alias rm='rm -i'
alias mv='mv -i'

# Todo
alias todo='grep -rn --color TODO ./*'

# Find process
alias proc='ps ax | grep'

# iOS Simulator
alias iossim='open -n /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

# Docker
alias d="docker"
alias dm="docker-machine"
alias dc="docker-compose"

# tmux
alias tm="tmux"

# curl
alias curlt="curl -w '@$HOME/dotfiles/curl-format.txt'"

# ------- Path -------
export PATH=$HOME/dotfiles/bin:$PATH
