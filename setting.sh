#!bin/bash

echo /etc/hosts >> 163.152.162.75	kuserver    #Make Domain Name Service

sudo apt-get update;
sudo apt-get upgrade;

sudo apt-get install \
    zsh \
    tmux \
    wget \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    tmux \
    python3-pip \
    python-pip

chsh -s /usr/bin/zsh hunjong;
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)";

#Docker 
git clone https://github.com/docker/docker-install.git;
curl -fsSL https://get.docker.com -o get-docker.sh;
sh get-docker.sh;
rm -rf ../docker-install;

