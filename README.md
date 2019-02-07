#linux-configs
Scripts and configurations to install on a new linux machine
## Setup
1. First, clone this repo to your home directory.
```
cd ~
git clone https://github.com/anhdngo/linux-configs.git 
cd ~/linux_configs
```
2. Then, install git submodules.
```
git submodule update --init
```
- Alternatively, you can recursively clone the repository, automatically cloning the submodules.
```
cd ~
git clone --recursive https://github.com/anhdngo/linux-configs.git
cd ~/linux_configs
```

### Dotbot
Dotbot is a dotfile bootstrapper: it creates links to your dotfiles in the home directory allowing them to be sourced and easily referenced. To install, run the dotbot binary and insert dotbot.conf.yaml as an argument.
```
./dotbot/bin/dotbot -c dotfiles/dotbot.conf.yaml
```
Dotfiles Included:
- vimrc
- tmux
- bash_aliases

### Install Scripts
UNDER DEVELOPMENT
You can test it out by running install.sh or install.py, but I take no responsibility if your computer bursts into flames!
```
sudo ./install.sh
```
```
sudo python3 install.py
```
