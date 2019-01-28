import os
import sys

essentialspath = os.path.abspath("./aptessentials.txt")
essentialprograms = []

def main():
    if os.getuid() != 0:
        raise Exception("This program must be run with elevated permissions, rerun this script with sudo!")

    installessentials()
    installultimatevimrc()
    miscconfigurations()

def installessentials():
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
    
def installultimatevimrc():
    # clone repo and run installation
    os.system('git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime')
    os.system('sh ~/.vim_runtime/install_awesome_vimrc.sh')

    # cat nerdtree configs into vimrc
    os.system('cat ./nerdtreetweaks >> ~/.vimrc')
    
def miscconfigurations():
    # copy aliases file to correct location, source aliases in .bashrc
    # TODO

    # copy tmux configuration file to correct location
    os.system('cp ./tmux.conf ~/.tmux.conf')





if __name__ =='__main__':
    main()
