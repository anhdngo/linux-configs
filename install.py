import os
import sys

essentialspath = os.path.abspath("./aptessentials.txt")
essentialprograms = []

def main():
    if os.getuid() != 0:
        raise Exception("This program must be run with elevated permissions, rerun this script with sudo!")

    # prompt user input for each component
    prompt("Install essentials?", installessentials)
    prompt("Install ultimate vimrc?", installultimatevimrc)
    prompt("Install dotbot?", installdotbot)
    prompt("Install ohmyzsh?", installohmyzsh)
    prompt("Install themes?", installthemes)

def prompt(promptstring, installfunc):
    txt = input(promptstring + " [y/N]")
    if(txt.lower() == 'y'):
        installfunc()

def installessentials():
    print('Installing essential apt packages...')

    # read essentials file
    with open(essentialspath, 'r') as essentials:
        for line in essentials:
            # ignore blank lines and comments
            li = line.strip()
            if len(li) == 0 or li.startswith('#'):
                continue
            # read each line into array of programs
            essentialprograms.append(line.strip())

    os.system('sudo apt install -y  ' + ' '.join(essentialprograms))

    # install git submodules
    os.system('git submodule update --init')

def installultimatevimrc():
    print('Installing ultimate vimrc...')

    # clone repo and run installation
    os.system('git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime')
    os.system('sh ~/.vim_runtime/install_awesome_vimrc.sh')

    # cat nerdtree configs into vimrc
    os.system('cat ./nerdtreetweaks >> ~/.vimrc')

def installdotbot():
    print('Installing dotbot...')

    # allow dotbot to bootstrap dotfiles
    os.system('./dotbot/bin/dotbot -c ./dotfiles.conf.yaml')

def installohmyzsh():
    print('Installing oh my zsh')

    # installing oh-my-zsh
    os.system('./tools/install.sh')
    os.system('chsh -s zsh')

def installthemes():
    print('Installing themes')

    # installing arc theme
    os.system('cd ./arc-theme')
    os.system('./autogen.sh')
    os.system('sudo make install')
    os.system('cd ..')

if __name__ =='__main__':
    main()
