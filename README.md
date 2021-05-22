## dev-machine-setup

Quick script to set your timezone and allows you to install specific tools, currently asks to install the following software:

* zsh + oh-my-zsh
* VsCode
* PHP7.4
* Google Chrome
* PhpStorm
* Docker


### Installation

*( if you don't have git )*


```
sudo apt-get install git -y && git clone git@github.com:arxpw/dev-machine-setup.git
chmod +rwx install.sh install-php.sh
```

Usage

```
cp settings.defaults settings.conf
```

Edit your `settings.conf` file and change any defaults you require.

Run
`./install.sh`
