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
    prompt("Install pyenv?", installpyenv)

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
    os.system('cat ./nerdtreetweaks.vimrc >> ~/.vimrc')

def installdotbot():
    print('Installing dotbot...')

    os.system('pip install dotbot')

    # clone repo
    os.system('git clone https://github.com/anishathalye/dotbot.git')

    # allow dotbot to bootstrap dotfiles
    os.system('./dotbot/bin/dotbot -c ./dotfiles/dotbot.conf.yaml')

def installohmyzsh():
    print('Installing oh my zsh')

    # clone repo
    os.system('git clone https://github.com/robbyrussell/oh-my-zsh.git')

    # installing oh-my-zsh
    os.system('./oh-my-zsh/tools/install.sh')
    os.system('chsh -s zsh')

def installthemes():
    print('Installing themes')

    # clone repo
    os.system('git clone https://github.com/horst3180/arc-theme.git')

    # installing arc theme
    os.system('cd ./arc-theme')
    os.system('./autogen.sh')
    os.system('sudo make install')
    os.system('cd ..')

def installpyenv():
    print('Installing pyenv')

    # clone repo
    os.system('git clone https://github.com/pyenv/pyenv.git ~/.pyenv')

if __name__ =='__main__':
    main()
