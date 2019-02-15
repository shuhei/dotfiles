#!/usr/bin/env bash

pushd ~

case $(uname -s) in
Darwin)
  # -- Homebrew
  ~/dotfiles/brew.sh
  # -- Karabiner
  ln -s dotfiles/karabiner ~/.config
  # To maximize MacVim's window horizontally as well as vertically
  defaults write org.vim.MacVim MMZoomBoth 1
  ;;
Linux)
  ~/dotfiles/ubuntu.sh
  ;;
esac

# -- Vim
ln -s dotfiles/.vim .vim
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.ideavimrc .ideavimrc

# -- NeoVim
mkdir -p ~/.config
pushd ~/.config
ln -s ~/dotfiles/.vim nvim
popd
# For python3 support. Otherwise you'll get:
# [deoplete] deoplete.nvim does not work with this version.
# [deoplete] It requires Neovim with Python3 support("+python3").
pip3 install --upgrade pip
pip3 install neovim

# dein.vim
pushd dotfiles
mkdir -p .vim/dein/repos
git clone https://github.com/Shougo/dein.vim .vim/dein/repos/github.com/Shougo/dein.vim
popd

# -- tmux
ln -s dotfiles/.tmux.conf .tmux.conf
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

popd
