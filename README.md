# Dotfiles

My personal configurations for Vim, tmux, Alacritty, Git, etc.

## Installation

Clone this repository to your home directory and run the init script.

```shell
cd ~
git clone git@github.com:shuhei/dotfiles.git

./dotfiles/init.sh
```

Check `alacritty/base.yml` and install the fonts used in the configuration.

## Color scheme

Use `colorscheme` command to update color schemes of Alacritty, Vim and partially tmux together.

```shell
# Good for morning
colorscheme ayu-light
# Good for night
colorscheme nord
colorscheme pink-moon
```

The command generates `.alacritty.yml` and `.tmux.color.conf`.

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

# Load before oh-my-zsh.sh because `plugins` are listed in this file.
source ~/dotfiles/.zshrc

# Set a custom directory for the custom prompt
ZSH_CUSTOM=~/dotfiles/.oh-my-zsh
ZSH_THEME="euro"

source $ZSH/oh-my-zsh.sh
```

[Delete completion cache files](https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#i-have-enabled-a-completion-plugin-but-the-completion-doesnt-work) when you add a new completion plugin.

### Cookbook

- Reload `.zshrc` including completion: `reload_zsh`
- Fuzzy-find command arguments: `<C-t>` or `**<TAB>` (read [junegunn/fzf](https://github.com/junegunn/fzf) for more)

## Git

At the top of `~/.gitconfig`:

```
[include]
  path = ~/dotfiles/.gitconfig
```

Don't forget to set your user name and email address:

```sh
git config --global user.name "Shuhei Kagawa"
git config --global user.email "shuhei.kagawa@gmail.com"
```

## Vim

### Vim 8 vs Neovim

This repo’s configuration should be compatible with both of Neovim and Vim 8. To switch between them, delete `~/.cache/dein` and install `dein.vim` again because the cache directory built for Vim 8 doesn't work for Neovim and vice versa.

### Cookbook

#### Text Editing

- Change `''` to `""`: `cs'"` ([vim-surround](https://github.com/tpope/vim-surround))

#### Navigation

- Open the file navigator: `,f`
  - Toggle help: `?`
  - File operations: `m`
- Search for a file by name (only files in git): `<C-p>`
  - Open a file: `<CR>`
  - Open a file in a vertical split: `<C-v>`
  - Close `fzf`: `<C-c>` or `<ESC>`
- Search for a file by name (all files): `<C-a>`
- Grep files: `<C-g>`
- Open a list of buffers: `,b`
- Open URL under the cursor: `gx`
- Move to the file under the cursor: `gf`
- Go back to the previous position in a file: `<C-o>` or ` `` `
- Go forward again after `<C-o>`: `<C-i>`
- Go back to the previous buffer: `:bp`

#### Window

- Move to the left/right window: `<C-s>h`/`<C-s>l` (`:help window-move-cursor`)
- Move the current window to the left/right: `<C-w>H`/`<C-w>L` (`:help window-moving`)

#### Git

- Show git commit history: `<C-c>` (fzf) or `,gv` (gitv)

#### Plugins

- Update plugins: `:call dein#update()`
- Check plugins unnecessarily loaded as lazy plugins: `:echo dein#check_lazy_plugins()`

#### Switching modes

- Back to normal mode: `<Esc>` or `<C-[>`
- One-off command in insert mode: `<C-o>`

#### Misc

- Resize panes: `,<`, `,>`
- Reload `.vimrc`: `:so $MYVIMRC`
- Focus mode: `,<Space>`
- Add a word to the spell check dictionary: `zg` (`:help spell` for more information)
- Show highlighting at the cursor: `,hl`
- Organize imports `:OR`

## tmux

### Cookbook

- Open session list: `<C-s>s`
- Save sessions: `<C-s><S-s>`
- Restore sessions: `<C-s><S-r>`
- Enter copy mode: `<C-s>p`
  - Start selection: `v`
  - Start rectangle selection: `<C-v>`
- Reload tmux config: `<C-s>I`
- Switch layout (vertical <-> horizontal): `<C-s><Space>`
- Resize panes horizontally: `<C-s><Left>`, `<C-s><Right>`
- Resize panes vertically: `<C-s><Up>`, `<C-s><Down>`

#### Focus mode

- Start: `<C-s><C-g>`
- End: `<C-s><C-d>`
- Increase pane width: `<C-s>=`
- Decrease pane width: `<C-s>-`

### Plugins

- Install plugins: `<C-s>I`
- Update plugins: `<C-s>U`
