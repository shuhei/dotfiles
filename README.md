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

- Use iTerm 2 on Mac and set `Preferences > Profiles > Terminal > Terminal Emulation > Report Terminal Type` to `xterm-256color`.
- 'Cobalt2' preset is my current favorite color preset.

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

### Diff of MS Office files (if necessary...)

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

### To update plugins

```
:call dein#update()
```

### To have a nice vim-airline status bar (if you want)

Install a font patched for vim-airline like [Monaco font](https://gist.github.com/baopham/1838072). Set it as Non-ASCII Font of iTerm2.
