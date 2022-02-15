#! /usr/bin/zsh

cd
wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
chmod +x Anaconda3-2021.11-Linux-x86_64.sh
./Anaconda3-2021.11-Linux-x86_64.sh

/root/anaconda3/bin/conda init zsh
source ~/.zshrc
