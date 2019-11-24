# linux-configs
Scripts and configurations to install on a new linux machine
## Setup
First, clone this repo to your home directory.
```
cd ~
git clone --depth=1 https://github.com/anhdngo/linux-configs.git ~/.linux_configs 
cd ~/.linux_configs
```

### Dotbot
Dotbot is a dotfile bootstrapper: it creates links to your dotfiles in the home directory allowing them to be sourced and easily referenced. To install, run the dotbot binary and insert dotbot.conf.yaml as an argument.
```
make dotbot
```

### Install Scripts
#### To install apt packages
```
make apt
```

### Side Notes
To set lightdm background, copy wallpaper to `/usr/share/backgrounds`, edit /etc/lightdm/\*-greeter.conf to use wallpaper, and set user-wallpaper=false
