# linux-configs
Scripts and configurations to install on a new linux machine
## Setup
1. First, clone this repo to your home directory.
```
cd ~
git clone --depth=1 https://github.com/anhdngo/linux-configs.git ~/.linux_configs 
cd ~/.linux_configs
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
- i3

### Install Scripts
UNDER DEVELOPMENT
THE DEVELOPER TAKES NO RESPONSIBILITY FOR ANY DAMAGE TO THE COMPUTER OR THE USER
SUCH DAMAGE MAY INCLUDE CUTS, BURNS, BRAIN DAMAGE, DEATH, AND ACCIDENTAL INSTALLATION OF THE WINDOWS OS
```
sudo python3 install.py
```
