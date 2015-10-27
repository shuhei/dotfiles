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

# neobundle.vim
pushd dotfiles
git clone https://github.com/Shougo/neobundle.vim.git .vim/bundle/neobundle.vim
popd

# To maximize MacVim's window horizontally as well as vertically
defaults write org.vim.MacVim MMZoomBoth 1

# -- tmux
ln -s dotfiles/.tmux.conf .tmux.conf

popd
