# Dotfiles

My personal dotfiles.

## Installation

Clone this repository to your home directory and create symlinks.

    cd ~
    git clone git@github.com:shuhei/dotfiles.git
    ln -s dotfiles/.foo .foo

Keep environement-specific git configs such as user name and email in `~/.gitconfig.local`.

## Vim

Vim bundles are added to this respository as git submodules. Make sure to check them out.

    cd ~/dotfiles
    git submodule init
    git submodule update

If you want to add more vim plugins, add them as git submodules and commit.

    cd ~/dotfiles
    git submodule add https://github.com/foo/vim-bar .vim/bundle/vim-bar
    git commit -m "Add vim bar plugin."

