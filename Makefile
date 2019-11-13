.PHONY: apt
apt:
	sudo apt install $(grep -vE "^\s*#" apt.txt | tr "\n" " ")

.PHONY: dotbot
dotbot:
	git submodule update --init --recursive
	sh ./dotfiles/dotbot/bin/dotbot -c ./dotfiles/dotbot.conf.yaml
    
.PHONY: i3gaps
i3gaps:
    sh ./i3-gaps.sh
