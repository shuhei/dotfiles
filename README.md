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
- Get color presets from [mbadolato/iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes). "Smyck" is my current favorite color preset.
- Set a font. Here is a list of some cool terminal fonts:
  - Fira Code (My current favorite)
  - Inconsolata

## Bash

At the bottom of `~/.bash_profile`:

```shell
source ~/dotfiles/.bash_profile
```

## Zsh

Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh).

`~/.zshrc`:

```shell
export ZSH="/Users/shuhei/.oh-my-zsh"
ZSH_THEME="euro"

export ZSH_CUSTOM=~/dotfiles/.oh-my-zsh

plugins=(
  git
  fzf
  zsh_reload
)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/.zshrc
```

Use `src` (provided by `zsh_reload`) to reload `.zshrc`.

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

### To have a nice vim-airline status bar (if you want)

Install a font patched for vim-airline like [Monaco font](https://gist.github.com/baopham/1838072). Set it as Non-ASCII Font of iTerm2.

### Vim 8 vs Neovim

I'm currently using Vim 8, but the configuration should be compatible with Neovim. To switch back to Neovim, delete `~/.cache/dein` and install `dein.vim` again because the cache directory built for Vim 8 doesn't work for Neovim and vice versa.

### Cookbook

- Update plugins: `:call dein#update()`
- Open the file navigator (vimfiler): `,f`
  - Toggle safe mode: `gs`
  - Delete a file: `dd`
  - Rename a file: `r`
- Search for a file by name: `<C-p>`
- Grep files: `<C-g>`
- Show git commit history: `<C-c>` (fzf) or `,gv` (gitv)
- Open a list of tabs: `,ut`
- Focus mode: `,<Space>`
- Resize panes: `,<`, `,>`
- Open URL under the cursor: `gx`
- Add a word to the spell check dictionary: `zg` (`:help spell` for more information)

## tmux

### Cookbook

- Open session list: `<C-s>s`
- Save sessions: `<C-s><S-s>`
- Restore sessions: `<C-s><S-r>`
- Enter copy mode: `<C-s>p`
  - Start selection: `v`
  - Start rectangle selection: `<C-v>`
