#! /bin/bash

# Make Domain Name Service
# echo "163.152.162.75	kuserver" >> /etc/hosts   

while true; do
	read -p "Settings for Docker? [Y/n] " response
	case $response in
		[Nn] ) var='sudo'; break;;
		[Yy] ) var=''; break;;
	esac
done

$var apt-get update && $var apt-get upgrade

echo "***************************"
echo "***************************"
echo "Install Pacakge"
echo "***************************"
echo "***************************"
$var apt-get install -y \
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
	cmake \
    build-essential \
    bear \
	ctags \
	software-properties-common

# Upgrade Vim version > 8.2
$var add-apt-repository -y ppa:jonathonf/vim
$var apt-get update -y
$var apt-get upgrade -y vim

$var apt-get install -y net-tools less 
echo "***************************"
echo "***************************"
echo "Install Package Done!"
echo "***************************"
echo "***************************"

#git settings
echo "***************************"
echo "git config hunjong@korea.ac.kr"
echo "***************************"
git config --global user.email "hunjong@korea.ac.kr"
git config --global user.name "hunjong"

# Install Zsh
echo "***************************"
echo "***************************"
echo "Install Zsh"
echo "***************************"
echo "***************************"
$var apt-get install -y zsh

chsh -s $(which zsh) hunjong
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
if [ $var -eq 'sudo' ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions /home/$(whoami)/.oh-my-zsh/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$(whoami)/.oh-my-zsh/plugins/zsh-syntax-highlighting
else
	git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
$var apt-get install -y language-pack-en
$var update-locale
sed -i "11s/.*/  ZSH_THEME="agnoster"/g" ~/.zshrc
sed -i "73s/.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g" ~/.zshrc
echo "alias tm='tmux' 
alias cl='clear' 
alias lt='ls -lt'
alias ta='tmux attach'
alias td='tmux detach'
# Auto Suggestion accpet key binding
bindkey '!' autosuggest-accept
bindkey "^L" forward-word
bindkey "^H" backward-word
bindkey "^J" backward-char
bindkey "^K" forward-char" >> ~/.zshrc

# Configure Vim"
echo "***************************"
echo "Configure Vim"
echo "***************************"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc_docker ~/.vimrc
curl -sL install-node.vercel.app/lts | zsh
vim +PluginInstall +qall
vim +PlugInstall +qall
vim -c "CocInstall coc-clangd coc-pyright coc-tsserver"

#Docker 
#git clone https://github.com/docker/docker-install.git;
#curl -fsSL https://get.docker.com -o get-docker.sh;
#sh get-docker.sh;
#rm -rf ../docker-install;

echo "***************************"
echo "***************************"
echo "Configuration Initial Linux Done"
echo "***************************"
echo "Restart zsh"
echo "***************************"
echo "***************************"

exec zsh
