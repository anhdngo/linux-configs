.PHONY: common
common: ohmyzsh dotbot pathogen vim-plugins qute-plugins

.PHONY: manjaro
manjaro: pacman common

.PHONY: xubuntu
xubuntu: apt common

.PHONY: wsl
wsl:


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

.PHONY: pathogen
pathogen:
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

.PHONY: vim-plugins
vim-plugins: pathogen
	git clone https://github.com/itchyny/lightline.vim.git ~/.vim/bundle/lightline.vim
	git clone https://github.com/terryma/vim-smooth-scroll.git ~/.vim/bundle/vim-smooth-scroll
	git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
	git clone https://github.com/vimwiki/vimwiki.git ~/.vim/bundle/vimwiki
	git clone https://github.com/masukomi/vim-markdown-folding ~/.vim/bundle/vim-markdown-folding
.PHONY: symlinks
symlinks:
	ln -s $(JDFS)/10-19-workspace ~/workspace
	ln -s $(JDFS)/10-19-workspace/11-orgs/11.00-tuas ~/tuas

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
	cd yay
	makepkg -si
	rm -rf ./yay
