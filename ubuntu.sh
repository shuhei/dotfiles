sudo apt update
sudo apt install git tmux docker.io

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
