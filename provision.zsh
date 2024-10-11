#!/usr/bin/zsh

# TODO:
# Add some prompts and echos and stuff?

# run script on a new system to install stuff
# distro-specific lines are commented out at the top
# run those manually based on your distro

# sudo apt update
# sudo apt upgrade
# sudo apt install zsh gh miller jq

# install hledger binary
cd /usr/local/bin
curl -LOC- https://github.com/simonmichael/hledger/releases/download/1.34/hledger-linux-x64.tar.gz
tar xvf hledger-linux-x64.tar.gz && rm -f hledger-linux-x64.tar.gz
cd
hledger --version    # should show 1.34


# oh-my-zshell and plugins
# git clone https://github.com BLAH BLAH OH-MY-ZSH REPOOOOO
rm .bash_logout .bashrc .profile .shell.pre-oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/akash329d/zsh-alias-finder ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-alias-finder  
git clone --recursive https://github.com/joel-porquet/zsh-dircolors-solarized $ZSH_CUSTOM/plugins/zsh-dircolors-solarized
git clone https://github.com/robertzk/send.zsh.git $ZSH_CUSTOM/plugins/send

# my github repos
omz reload
gh auth login
gh repo clone dotfiles
gh repo clone finance
rm .zshrc
ln -s dotfiles/.zshrc

# for chromeos only
# ln -s /mnt/chromeos/MyFiles/Downloads
