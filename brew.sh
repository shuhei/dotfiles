#!/usr/bin/env bash

brew install git bash-completion
brew install tmux
brew install the_silver_searcher

# Some neovim plugins require python3.
brew install python3
brew install neovim

# For https://github.com/autozimu/LanguageClient-neovim
# and https://github.com/junegunn/fzf.vim
brew install fzf
$(brew --prefix)/opt/fzf/install
