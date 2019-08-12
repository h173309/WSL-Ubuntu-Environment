#!/bin/sh
cd

# dotfiles
git clone https://github.com/h173309/dotfiles.git
cd dotfiles
./install.sh

# install linuxbrew
sudo apt install ruby
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)

echo -e 'export PATH=${HOME}/.linuxbrew/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# install zsh
brew install zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

chzh
