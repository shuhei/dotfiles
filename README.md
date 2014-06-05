# Dotfiles

My personal dotfiles.

## Installation

Clone this repository to your home directory and create symlinks.

```shell
cd ~
git clone git@github.com:shuhei/dotfiles.git
ln -s dotfiles/.foo .foo
```

Keep environment-specific git configs such as user name and email in `~/.gitconfig.local`.

## KeyRemap4MacBook

To add private configuration items, symlink the `private.xml` to the Application Support directory.

```shell
cd ~
ln -s ~/dotfiles/.keyremap4macbook/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/
```

## Vim

### Version

Use the latest version with lua enabled that is required by neocomplete plugin.

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

And you will be asked to install bundles when you launch vim. Installing bundles on start-up makes CSApprox throw some errors. Just ignore them and launch vim again.

### Syntax Check

Syntactic plugin is employed to perform syntax check. Make sure to prepare proper executables.

- rubocop for ruby
- jshint for javascript
- coffeelint for coffee
