#!/usr/bin/env bash

brew install git
brew install tmux
brew install the_silver_searcher

# Some vim plugins require python3.
brew install python3
brew install neovim

# For https://github.com/junegunn/fzf.vim
brew install fzf
brew install ripgrep
$(brew --prefix)/opt/fzf/install
