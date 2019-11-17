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

.PHONY: vim-plugins
vim-plugins: pathogen
    git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle
    git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle
    git clone https://github.com/vimwiki/vimwiki.git ~/.vim/bundle

.PHONY: symlinks
symlinks:
	ln -s $(JDFS)/10-19-workspace ~/workspace
	ln -s $(JDFS)/10-19-workspace/11-orgs/11.00-tuas ~/tuas
