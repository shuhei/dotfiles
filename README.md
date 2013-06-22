My personal dotfiles.

Make sure to create symlinks.

    cd ~
    ln -s dotfiles/.foo .foo

Load vim bundles as git submodules.

    git submodule init
    git submodule update

Also, set the following filter not to commit your secret keys.

    git config filter.secret.clean './secret.rb %f'
