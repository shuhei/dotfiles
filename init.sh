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

# -- deoplete.nvim, etc.
pip3 install --user pynvim

# -- dein.vim
pushd dotfiles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein
popd

# -- tmux
ln -s dotfiles/.tmux.conf .tmux.conf
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

popd
