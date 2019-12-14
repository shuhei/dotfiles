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
- Set a font (a patched one from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) to support vim-airline symbols). Here is a list of some cool terminal fonts:
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

### Cookbook

- Reload `.zshrc`: `src` (provided by `zsh_reload`)
- Fuzzy-find command arguments: `<C-t>` or `**<TAB>` (read [junegunn/fzf](https://github.com/junegunn/fzf) for more)

## Git

At the top of `~/.gitconfig`:

```
[include]
  path = ~/dotfiles/.gitconfig
```

## Vim

### Vim 8 vs Neovim

I'm currently using Vim 8, but the configuration should be compatible with Neovim. To switch back to Neovim, delete `~/.cache/dein` and install `dein.vim` again because the cache directory built for Vim 8 doesn't work for Neovim and vice versa.

### Cookbook

#### Navigation

- Open the file navigator (vimfiler): `,f`
  - Toggle safe mode: `gs`
  - Delete a file: `dd`
  - Rename a file: `r`
- Search for a file by name (only files in git): `<C-p>`
- Search for a file by name (all files): `<C-o>`
- `git grep` files: `<C-g>`
- Open a list of tabs: `,ut`
- Open URL under the cursor: `gx`
- Move to the file under the cursor: `gf`

#### Git

- Show git commit history: `<C-c>` (fzf) or `,gv` (gitv)

#### Misc

- Update plugins: `:call dein#update()`
- Resize panes: `,<`, `,>`
- Reload `.vimrc`: `:so $MYVIMRC`
- Focus mode: `,<Space>`
- Add a word to the spell check dictionary: `zg` (`:help spell` for more information)

## tmux

### Cookbook

- Open session list: `<C-s>s`
- Save sessions: `<C-s><S-s>`
- Restore sessions: `<C-s><S-r>`
- Enter copy mode: `<C-s>p`
  - Start selection: `v`
  - Start rectangle selection: `<C-v>`
