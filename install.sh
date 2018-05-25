#!/bin/bash

###################
#  PACKAGES SETUP #
###################

echo -n "Install all packages? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ; then
    apt-get update
    apt-get install -y git chromium-browser vim

else
    echo "Skipping install packages."
fi

###################
#   VIMRC SETUP   #
###################

echo -n "Install .vimrc? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ; then
    # Gets .vimrc from github.com/amix/vimrc and installs basic configuration
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_basic_vimrc.sh

    # Appends vimrc with custom vimrc in this folder
    cat vimrc >> ~/.vimrc

else
    echo "Skipping install .vimrc"
fi
