# Dotfiles

My personal dotfiles.

## Installation

Clone this repository to your home directory and run the init script.

```shell
cd ~
git clone git@github.com:shuhei/dotfiles.git

./dotfiles/init.sh
```

## iTerm 2

Use iTerm 2 on Mac and set `Preferences > Profiles > Terminal > Terminal Emulation > Report Terminal Type` to `xterm-256color`.

'Pastel (Dark Background)' preset is my favorite.

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

### Diff of MS Office files

To see diffs of MS Office files in text, install tika:

```shell
brew install tika
```

And add `.gitattributes` to your project.

```
*.pptx diff=office
*.docx diff=office
*.xlsx diff=office
```

## Vim

### Syntax Check

Syntactic plugin is employed to perform syntax check. Make sure to prepare proper executables.

- rubocop for ruby
- eslint and jscs for javascript
- coffeelint for coffee

### Font

Install [patched Monaco font](https://gist.github.com/baopham/1838072) for vim-airline. Set it as Non-ASCII Font of iTerm2.
