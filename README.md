My personal dotfiles.

Make sure to create symlinks.

    cd ~
    ln -s dotfiles/.foo .foo

Also, set the following filter not to commit your secret keys.

    git config filter.secret.clean './secret.rb %f'
