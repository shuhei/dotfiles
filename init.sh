#!/usr/bin/env bash

pushd ~

# -- Homebrew
./dotfiles/brew.sh

# -- Karabiner
ln -s dotfiles/.karabiner/private.xml ~/Library/Application\ Support/Karabiner/

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
pip3 install --upgrade pip
pip3 install neovim

# dein.vim
pushd dotfiles
mkdir -p .vim/dein/repos
git clone https://github.com/Shougo/dein.vim .vim/dein/repos/github.com/Shougo/dein.vim
popd

# To maximize MacVim's window horizontally as well as vertically
defaults write org.vim.MacVim MMZoomBoth 1

# -- tmux
ln -s dotfiles/.tmux.conf .tmux.conf

# -- Hyper
ln -s dotfiles/.hyper.js .hyper.js

popd
