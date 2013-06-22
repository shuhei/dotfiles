# Dotfiles

My personal dotfiles.

## Installation

Clone this repository to your home directory and create symlinks.

    cd ~
    git clone git@github.com:shuhei/dotfiles.git
    ln -s dotfiles/.foo .foo

## Vim

Vim bundles are added to this respository as git submodules. Make sure to check them out.

    cd ~/dotfiles
    git submodule init
    git submodule update

If you want add to more vim bundles, add them as git submodules and commit.

    cd ~/dotfiles
    git submodule add git@github.com:foo/bar.git .vim/bundle/bar
    git commit -m "Add bar."

## Omit sensitive information

Set the following filter not to commit your secret keys.

    git config filter.secret.clean './secret.rb %f'
