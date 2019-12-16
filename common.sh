# Common shell config for bash and zsh

# Colorful ls
export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagaced'

# Colorful grep
# GREP_OPTIONS is deprecated...
alias grep='grep --color=auto'

# Colorful less
export LESS='-R'

# ------- Aliases -------

# vim
alias vi="nvim"
alias vim="nvim"
export EDITOR=$(which nvim)

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
