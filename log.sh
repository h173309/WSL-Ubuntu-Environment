#!/bin/sh
cd

sudo apt update

# install linuxbrew
# https://docs.brew.sh/Homebrew-on-Linux
sudo apt install build-essential

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
brew install hello

# git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
# mkdir ~/.linuxbrew/bin
# ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
# eval $(~/.linuxbrew/bin/brew shellenv)

# echo -e 'export PATH=${HOME}/.linuxbrew/bin:$PATH' >> ~/.bashrc
# source ~/.bashrc

# install zsh
brew install zsh
which zsh | sudo tee -a /etc/shells
chzh -s `which zsh`

# dotfiles
git clone https://github.com/h173309/dotfiles.git
cd dotfiles
sh install.sh
