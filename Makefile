.PHONY: common
common: ohmyzsh dotbot vim-plugins

.PHONY: manjaro
manjaro: pacman common yay

.PHONY: xubuntu
xubuntu: apt common

.PHONY: pacman
pacman:
	sudo pacman -S $(shell grep -vE "^\s*#" ./pacman.txt | tr "\n" " ")

.PHONY: apt
apt:
	sudo apt install $(shell grep -vE "^\s*#" apt.txt | tr "\n" " ")

.PHONY: dotbot
dotbot:
	git submodule update --init --recursive
	sh ./dotfiles/dotbot/bin/dotbot -c ./dotfiles/dotbot.conf.yaml
    
.PHONY: i3gaps
i3gaps:
	sh ./i3-gaps.sh

.PHONY: ohmyzsh
ohmyzsh:
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/ohmyzsh.sh
	chmod +x /tmp/ohmyzsh.sh
	sh -c /tmp/ohmyzsh.sh

.PHONY: vim-plugins
vim-plugins:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

.PHONY: qute-plugins
qute-plugins:
	mkdir -p ~/.local/share/qutebrowser/userscripts
	curl https://raw.githubusercontent.com/qutebrowser/qutebrowser/master/misc/userscripts/qute-lastpass > ~/.local/share/qutebrowser/userscripts/qute-lastpass
	chmod +x ~/.local/share/qutebrowser/userscripts/*
	sudo python3 -m pip install tldextract

.PHONY: dconf-dump-guake
dconf-dump-guake:
	dconf dump /apps/guake/ > dotfiles/guake.ini

.PHONY: hosts-crontab
cronjob = "* * * * * $(CONFIG)/scripts/checkhosts"
hosts-crontab:
	( sudo crontab -l 2>/dev/null; echo $(cronjob) ) | sudo crontab -

.PHONY: yay
yay:
	git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -si
	rm -rf ./yay

.PHONY: gitignore-global
gitignore-global:
	git config --global core.excludesfile $(shell pwd)/dotfiles/gitignore_global

.PHONY: disable-ipv6
disable-ipv6:
	sudo cp ./40-ipv6.conf /etc/sysctl.d/
