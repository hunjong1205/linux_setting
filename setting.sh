#! /bin/bash

echo /etc/hosts >> 163.152.162.75	kuserver    #Make Domain Name Service

sudo apt-get update;
sudo apt-get upgrade;

echo "***************************"
echo "Install Pacakge"
echo "***************************"
sudo apt-get install -y \
	vim \
    tmux \
    wget \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    tmux \
    python3 \
    python-pip \
	build-essential

sudo apt-get install -y net-tools less 
echo "***************************"
echo "Install Package Done!"
echo "***************************"

# Install Zsh
echo "***************************"
echo "Install Zsh"
echo "***************************"
sudo apt-get install zsh

chsh -s $(which zsh) hunjong;
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions .oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i "10s/.*/  ZSH_THEME="agnoster"" ~/.zshrc
sed -i "70s/.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)" ~/.zshrcw
echo "alias tm='tmux' 
alias cl='clear' 
alias lt='ls -lt'
alias ta='tmux attach'
alias td='tmux detach'" >> ~/.zshrc


#Docker 
#git clone https://github.com/docker/docker-install.git;
#curl -fsSL https://get.docker.com -o get-docker.sh;
#sh get-docker.sh;
#rm -rf ../docker-install;

echo "***************************"
echo "Configuration Initial Linux Done"
echo "***************************"
echo "Restart zsh"
echo "***************************"

