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

### Bundles

Vim bundles are added to this respository as git submodules. Make sure to check them out.

```
cd ~/dotfiles
git submodule init
git submodule update
```

Build vimproc.

```
cd ~/dotfiles/.vim/bundle/vimproc
make
```

If you want to add more vim plugins, add them as git submodules and commit.

```
cd ~/dotfiles
git submodule add https://github.com/foo/vim-bar .vim/bundle/vim-bar
git commit -m "Add vim bar plugin."
```

To update vim plugins, pull in their own directories and commit.

```
cd ~/dotfiles
git submodule foreach git pull origin master
git add -p
git commit -m "Update vim plugins."
```

To remove a vim plugin:

```
cd ~/dotfiles
git submodule deinit .vim/bundle/vim-foo
git rm .vim/bundle/vim-foo
git add -p
git commot -m "Remove vim-foo."
```
