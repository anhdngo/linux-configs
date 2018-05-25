#!/bin/bash

###################
#   VIMRC SETUP   #
###################

# Gets .vimrc from github.com/amix/vimrc and installs basic configuration
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

# Appends vimrc with custom vimrc in this folder
cat vimrc >> ~/.vimrc
