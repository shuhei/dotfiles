# Dotfiles

My personal dotfiles.

## Installation

Clone this repository to your home directory and create symlinks.

```
cd ~
git clone git@github.com:shuhei/dotfiles.git
ln -s dotfiles/.foo .foo
```

Keep environment-specific git configs such as user name and email in `~/.gitconfig.local`.

## KeyRemap4MacBook

To add private configuration items, symlink the `private.xml` to the Application Support directory.

```
cd ~
ln -s ~/dotfiles/.keyremap4macbook/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/
```

## Vim

### Version

Use the latest version with lua enabled that is required by neocomplete plugin.

On Mac:

```
brew install vim --with-lua
```

### Plugins

Vim plugins are managed with [Vundle](https://github.com/gmarik/Vundle.vim). Install it first:

```
cd ~/dotfiles
git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
```

And in vim, `:BundleInstall`.
