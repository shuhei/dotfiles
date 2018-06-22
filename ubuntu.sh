sudo apt update
sudo apt install git tmux docker.io net-tools htop apache2-utils

# neovim needs both of python2 and python3.
# How can I make it work on both? Maybe install directory?
sudo apt install python-pip python3-pip neovim
sudo pip install neovim
sudo pip3 install neovim

# perf command
sudo apt install linux-tools-common

# Build git diff-highlight
pushd /usr/share/doc/git/contrib/diff-highlight
sudo make
popd

# Node.js
sudo apt install curl
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
