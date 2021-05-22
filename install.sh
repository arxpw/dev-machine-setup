#!/bin/bash

config_file=settings.conf

if [ ! -f $config_file ];
  then echo "Copy the settings.defaults file to a $config_file file, and configure this to your liking."
  exit 1;
fi

source $config_file

function setupPHP {
  sudo ./install-php.sh
}

function setupGIT {
  sudo apt-get install git && git config --global user.email $YOUR_EMAIL && git config --global user.name $YOUR_NAME
  echo 'Git configured!'
}

function setupInsomnia {
  sudo snap install phpstorm --classic
}

function setupTimezone {
  sudo timedatectl set-timezone $TIMEZONE
}

function setupPhpStorm {
  sudo snap install phpstorm --classic
}

function setupVsCode {
  sudo snap install code --classic
}

function setupZsh {
  sudo apt-get install zsh -y && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

function setupChrome {
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ~/Downloads && sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
}

function setupDock {
  gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'code_code.desktop', 'phpstorm_phpstorm.desktop', 'insomnia_insomnia.desktop']"
}

function setupDocker {
  sudo apt-get install \
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
}

whiptail --title "Dev Machine Setup" --checklist --separate-output "Choose what to setup" 20 30 10 \
  "SETUP_GIT" "" $SETUP_GIT \
  "SETUP_PHP" "" $SETUP_PHP \
  "SETUP_TIMEZONES" "" $SETUP_TIMEZONES \
  "SETUP_INSOMNIA" "" $SETUP_INSOMNIA \
  "SETUP_PHPSTORM" "" $SETUP_PHPSTORM \
  "SETUP_VSCODE" "" $SETUP_VSCODE \
  "SETUP_GOOGLE_CHROME" "" $SETUP_GOOGLE_CHROME \
  "SETUP_ZSH" "" $SETUP_ZSH \
  "SETUP_DOCKER" "" $SETUP_DOCKER \
  "SETUP_DOCK" "" $SETUP_DOCK \
  2>results

while read choice
do
  case $choice in
    "SETUP_GIT") setupGIT ;;
    "SETUP_PHP") setupPHP ;;
    "SETUP_TIMEZONES") setupTimezone ;;
    "SETUP_INSOMNIA") setupInsomnia ;;
    "SETUP_PHPSTORM") setupPhpStorm ;;
    "SETUP_VSCODE") setupVsCode ;;
    "SETUP_GOOGLE_CHROME") setupChrome ;;
    "SETUP_ZSH") setupZsh ;;
    "SETUP_DOCKER") setupDocker ;;
    "SETUP_DOCK") setupDock ;;
    *)
    ;;
  esac
done < results
