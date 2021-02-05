#/bin/sh

TIMEZONE="Europe/London"

YOUR_EMAIL="john.doe@example.com"
YOUR_NAME="John Doe"

PROJECT_DIRECTORY="projects"

# set your timezone
sudo timedatectl set-timezone $TIMEZONE

# choose keyboard layout
sudo dpkg-reconfigure keyboard-configuration
sudo apt-get update

# php
read -p "Install PHP7.4 + Extensions? (y/n)" choice
case "$choice" in
  y|Y ) sudo ./install-php.sh;;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
esac

# phpstorm
read -p "Install Insomnia? (y/n)" choice
case "$choice" in
  y|Y ) sudo snap install insomnia;;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
esac

# phpstorm
read -p "Install PhpStorm? (y/n)" choice
case "$choice" in
  y|Y ) sudo snap install phpstorm --classic;;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
esac

# phpstorm
read -p "Install VsCode? (y/n)" choice
case "$choice" in
  y|Y ) sudo snap install code --classic;;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
esac

# version control
sudo apt-get install curl git wget -y

# set git defaults?
read -p "Set git defaults? (y/n)" choice
case "$choice" in
  y|Y ) git config --global user.email $YOUR_EMAIL && git config --global user.name $YOUR_NAME;;
  n|N ) echo "Not configuring..";;
  * ) echo "Skipping..";;
esac

# chrome
read -p "Install Google Chrome? (y/n)" choice
case "$choice" in
  y|Y ) wget -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ~/Downloads && \
	sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb;;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
esac

# zsh
read -p "Install ZSH + oh-my-zsh? (y/n)" choice
case "$choice" in 
  y|Y ) sudo apt-get install zsh -y && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
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
    sudo usermod -aG docker $USER && echo "Please restart to be able to use docker as your normal user." && \
    sudo wget https://github.com/docker/compose/releases/download/1.28.2/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose && sudo chmod +rwx /usr/local/bin/docker-compose
;;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
esac

mkdir ~/$PROJECT_DIRECTORY && cd ~/$PROJECT_DIRECTORY

# set ubuntu dock favorites?
read -p "Set dock favorites? ( requires chrome, vscode, phpstorm + insomnia to be installed ) (y/n)" choice
case "$choice" in
  y|Y ) gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'code_code.desktop', 'phpstorm_phpstorm.desktop', 'insomnia_insomnia.desktop']";;
  n|N ) echo "Not installing..";;
  * ) echo "Skipping..";;
esac
