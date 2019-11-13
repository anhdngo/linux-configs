.PHONY: apt
apt:
	sudo apt install $(grep -vE "^\s*#" apt.txt | tr "\n" " ")

.PHONY: pacman
pacman:
	sudo pacman -S $(grep -vE "^\s*#" pacman.txt | tr "\n" " ")

.PHONY: dotbot
dotbot:
	git submodule update --init --recursive
	sh ./dotfiles/dotbot/bin/dotbot -c ./dotfiles/dotbot.conf.yaml
    
.PHONY: i3gaps
i3gaps:
	sh ./i3-gaps.sh

.PHONY: ohmyzsh
ohmyzsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

.PHONY: pathogen
pathogen:
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
