#!/usr/bin/env bash

brew install git bash-completion
brew install rbenv ruby-build
brew install ghc
brew install haskell-stack
brew install flow
brew install tmux
brew install the_silver_searcher

# Some neovim plugins require python3.
brew install python3
brew install neovim/neovim/neovim
# For python3 support. Otherwise you'll get:
# [deoplete] deoplete.nvim does not work with this version.
# [deoplete] It requires Neovim with Python3 support("+python3").
pip3 install neovim
