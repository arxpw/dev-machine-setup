## dev-machine-setup

Quick script to set your timezone and allows you to install specific tools, currently asks to install the following software:

* zsh + oh-my-zsh
* VsCode
* PHP7.4
* Google Chrome
* PhpStorm
* Docker


### Installation

*( if you don't have git or curl )*


```
sudo apt-get install git curl -y && git clone https://github.com/arxpw/dev-machine-setup.git

chmod +rwx install.sh install-php.sh

cp settings.defaults settings.conf

./install.sh
```
