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
  yarn
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

I am using Neovim because of nicer experience at the moment. For example, Vim 8 shows flickering when opening a new file and hangs when syntax highlighting hangs.

However, the configuration should be compatible with both of Neovim and Vim 8. To switch between them, delete `~/.cache/dein` and install `dein.vim` again because the cache directory built for Vim 8 doesn't work for Neovim and vice versa.

### Cookbook

#### Text Editing

- Change `''` to `""`: `cs'"` ([vim-surround](https://github.com/tpope/vim-surround))

#### Navigation

- Open the file navigator (vimfiler): `,f`
  - Toggle safe mode: `gs`
  - Delete a file: `dd`
  - Rename a file: `r`
- Search for a file by name (only files in git): `<C-p>`
  - Open a file: `<CR>`
  - Open a file in a vertical split: `<C-v>`
  - Close `fzf`: `<C-c>` or `<ESC>`
- Search for a file by name (all files): `<C-a>`
- `git grep` files: `<C-g>`
- Open a list of tabs: `,ut`
- Open URL under the cursor: `gx`
- Move to the file under the cursor: `gf`
- Go back to the previous position in a file: `<C-o>` or ``` `` ```
- Go forward again after `<C-o>`: `<C-i>`
- Go back to the previous buffer: `:bp`

#### Window

- Move to the left/right window: `<C-s>h`/`<C-s>l` (`:help window-move-cursor`)
- Move the current window to the left/right: `<C-w>H`/`<C-w>L` (`:help window-moving`)

#### Git

- Show git commit history: `<C-c>` (fzf) or `,gv` (gitv)

#### Plugins

- Update plugins: `:call dein#update()`
- Check plugins that are unnecessarily loaded as lazy plugins: `:echo dein#check_lazy_plugins()`

#### Misc

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
- Reload tmux config: `<C-s>I`
