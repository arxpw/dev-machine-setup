#/bin/sh

TIMEZONE="Europe/London"

YOUR_EMAIL="john.doe@example.com"
YOUR_NAME="John Doe"

PROJECT_DIRECTORY="projects"

# set your timezone
sudo timedatectl set-timezone Europe/London

# choose keyboard layout
sudo dpkg-reconfigure keyboard-configuration

sudo apt-get update

# php
read -p "Install PHP7.4 + Extensions? (y/n)" choice
case "$choice" in
  y|Y ) sudo apt-get install php7.4 php7.4-xml php7.4-json php7.4-gd php7.4-cli php7.4-mysql php7.4-zip php7.4-bcmath -y;;
  n|N ) echo "Not installing..";;
  * ) echo "Invalid choice";;
esac

# phpstorm
read -p "Install PhpStorm? (y/n)" choice
case "$choice" in
  y|Y ) sudo snap install phpstorm --classic;;
  n|N ) echo "Not installing..";;
  * ) echo "Invalid choice";;
esac

# phpstorm
read -p "Install VsCode? (y/n)" choice
case "$choice" in
  y|Y ) sudo snap install code --classic;;
  n|N ) echo "Not installing..";;
  * ) echo "Invalid choice";;
esac

# version control
sudo apt-get install curl git wget -y

# git stuff
git config --global user.email $YOUR_EMAIL
git config --global user.name $YOUR_NAME

# chrome
read -p "Install Google Chrome? (y/n)" choice
case "$choice" in
  y|Y ) wget -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ~/Downloads && \
	sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb;;
  n|N ) echo "Not installing..";;
  * ) echo "Invalid choice";;
esac

# zsh
read -p "Install ZSH + oh-my-zsh? (y/n)" choice
case "$choice" in 
  y|Y ) sudo apt-get install zsh -y && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";;
  n|N ) echo "Not installing..";;
  * ) echo "Invalid choice";;
esac

# docker
read -p "Install docker? (y/n)" choice
case "$choice" in 
  y|Y ) sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    sudo apt-key fingerprint 0EBFCD88 && \
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" && \
    sudo apt-get update && \
    sudo apt-get install docker-ce docker-ce-cli containerd.io && \
    sudo usermod -aG docker $USER && echo "Please restart to be able to use docker as your normal user.";;
  n|N ) echo "Not installing..";;
  * ) echo "Invalid choice";;
esac

mkdir ~/$PROJECT_DIRECTORY && cd ~/$PROJECT_DIRECTORY
