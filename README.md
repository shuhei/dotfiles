# Dotfiles

My personal dotfiles.

## Installation

Clone this repository to your home directory and create symlinks.

```shell
cd ~
git clone git@github.com:shuhei/dotfiles.git
```

## iTerm 2

Use iTerm 2 on Mac and set `Preferences > Profiles > Terminal > Terminal Emulation > Report Terminal Type` to `xterm-256color`.

## Bash

At the bottom of `~/.bash_profile`:

```shell
source ~/dotfiles/.bash_profile
```

## Git

At the top of `~/.gitconfig`:

```
[include]
  path = ~/dotfiles/.gitconfig
```

To see diffs of MS Office files in text, install tika and add `.gitattributes` to your project.

```shell
brew install tika
```

```.gitattributes
*.pptx diff=office
*.docx diff=office
*.xlsx diff=office
```

## KeyRemap4MacBook

To add private configuration items, symlink the `private.xml` to the Application Support directory.

```shell
cd ~ ln -s ~/dotfiles/.keyremap4macbook/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/
```

## Vim

```shell
cd ~
ln -s dotfiles/.vim .vim
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
```

### Version

Use the latest version of MacVim with lua enabled that is required by neocomplete plugin.

On Mac:

```shell
brew install macvim --with-lua --override-system-vim
```

To maximize MacVim's window horizontally as well as vertically:

```shell
defaults write org.vim.MacVim MMZoomBoth 1
```

### Plugins

Vim plugins are managed with [neobundle.vim](https://github.com/Shougo/neobundle.vim). Install it first:

```shell
cd ~/dotfiles
git clone https://github.com/Shougo/neobundle.vim.git .vim/bundle/neobundle.vim
```

### Syntax Check

Syntactic plugin is employed to perform syntax check. Make sure to prepare proper executables.

- rubocop for ruby
- eslint and jscs for javascript
- coffeelint for coffee

### Font

Install [patched Monaco font](https://gist.github.com/baopham/1838072) for vim-airline. Set it as Non-ASCII Font of iTerm2.

## tmux

```shell
cd ~
ln dotfiles/.tmux.conf .tmux.conf
```
